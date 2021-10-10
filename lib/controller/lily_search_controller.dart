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
            garden: item['garden']['value'],
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
    if (res['results']['bindings'].length != 0) {
      for (final item in res['results']['bindings']) {
        String objective = "";

        if (item['o']['xml:lang'] != "" && item['o']['xml:lang'] != "ja") {
          objective = '#${item['o']['value']}';
        } else {
          objective = item['o']['value'];
        }

        if (tmp.containsKey(item['p']['value'])) {
          tmp[item['p']['value'].split('/').last.split('#').last] =
              '${tmp[item['p']['value']]}, $objective';
        } else {
          tmp[item['p']['value'].split('/').last.split('#').last] = objective;
        }
      }

      resModel = LilyModel(
        key: key,
        name: tmp['name'],
        nameKana: tmp['nameKana'],
        position: tmp['position'],
        garden: tmp['garden'],
        age: tmp['age'] != "" ? int.parse(tmp['age']) : null,
        birthDay: tmp.containsKey('birthDay') == true && tmp['birthDay'] != "" ?
      );
    }

    // TODO: implement detailSearch
    throw UnimplementedError();
  }
}
