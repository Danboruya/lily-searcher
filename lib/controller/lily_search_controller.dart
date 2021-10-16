import 'dart:convert';

import 'package:lily_searcher/controller/i_lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/repositories/lily_rdf_repository.dart';
import 'package:simple_logger/simple_logger.dart';

class LilySearchController implements ILilySearchController {
  LilySearchController(this._lilySearchRepository, this._logger);

  final LilyRdfRepository _lilySearchRepository;
  final SimpleLogger _logger;

  /// Search lily with specified search [word]
  @override
  Future<List<WordSearchModel>> wordSearch(String word) async {
    final rawRes = await _lilySearchRepository.retrieveLilyList(word);

    final Map<String, dynamic> res = jsonDecode(rawRes);
    _logger.finer(res.toString());

    List<WordSearchModel> resList = [];

    // List has value only when response has list of map
    if (res['results']['bindings'].length != 0) {
      String currentUri = "";

      for (final item in res['results']['bindings']) {
        if (currentUri != item['lily']['value']) {
          currentUri = item['lily']['value'];
        } else {
          continue;
        }

        String pos = item['position']['value'];
        String currentPos = item['position']['value'];

        for (final elm in res['results']['bindings']) {
          if (currentUri == elm['lily']['value'] &&
              currentPos != elm['position']['value']) {
            pos += ", ${elm['position']['value']}";
          }
        }

        resList.add(WordSearchModel(
            uri: item['lily']['value'],
            key: item['lily']['value'].split("/").last,
            name: item['name']['value'],
            nameKana: item['nameKana']['value'],
            garden: item['garden']['value'] ?? '不明',
            position: pos));
      }

      _logger.finer('Return : ${resList.length}records.');
    } else {
      resList = List.empty();
    }

    return resList;
  }

  @override
  Future<LilyModel> detailSearch(String key) async {
    final rawRes = await _lilySearchRepository.retrieveLilyDetail(key);

    final Map<String, dynamic> res = jsonDecode(rawRes);
    _logger.finer(res.toString());

    late LilyModel resModel;
    Map<String, dynamic> tmp = {};
    // List has value only when response has list of map
    if (res['@graph'].length != 0) {
      tmp = res['@graph'].last;

      // Extract lily's birthday
      DateTime? birthDay = tmp['birthDate'] != null
          ? DateTime(
              1970,
              int.parse(tmp['birthDate']
                  .split('-')[tmp['birthDate'].split('-').length - 1]),
              int.parse(tmp['birthDate']
                  .split('-')[tmp['birthDate'].split('-').length - 2]))
          : null;

      resModel = LilyModel(
        key: key,
        name: tmp['label'],
        nameKana: tmp['nameKana']['@value'],
        birthDay: birthDay,
        age: tmp['foaf:age'],
        garden: tmp['garden'] ?? "不明",
        position: tmp['position'] is List<dynamic>
            ? tmp['position'].toList().join(', ')
            : tmp['position'],
        anotherName:
            tmp['anotherName'] != null ? tmp['anotherName']['@value'] : null,
        birthPlace: tmp['birthPlace'] != null
            ? tmp['birthPlace']
                .where((elm) => elm['@language'] == 'ja')
                .toList()
                .first['@value']
            : null,
        bloodType: tmp['bloodType'],
        boostedSkill: tmp['boostedSkill'] is List<dynamic>
            ? tmp['boostedSkill'].toList().join(', ')
            : tmp['boostedSkill'],
        grade: tmp['lily:grade'],
        height: tmp['height'] != null ? double.tryParse(tmp['height']) : null,
        isBoosted: tmp['lily:isBoosted'],
        legion: tmp['legion'],
        legionJobTitle: tmp['legionJobTitle'],
        lifeStatus: tmp['lifeStatus'],
        rareSkill: tmp['rareSkill'],
        subSkill: tmp['subSkill'] is List<String>
            ? tmp['subSkill'].join(', ')
            : tmp['subSkill'],
        type: tmp['@type'],
        weight: tmp['weight'] != null ? double.parse(tmp['weight']) : null,
      );
    }

    return resModel;
  }
}
