import 'dart:convert';

import 'package:lily_searcher/controllers/i_lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/repositories/lily_rdf_repository.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:lily_searcher/utils/enums.dart';
import 'package:simple_logger/simple_logger.dart';

class LilySearchController implements ILilySearchController {
  LilySearchController(
      this._lilySearchRepository, this._logger, this._businessException);

  final LilyRdfRepository _lilySearchRepository;
  final SimpleLogger _logger;
  final BusinessException _businessException;

  @override
  Future<List<WordSearchModel>> searchAll() async {
    final rawRes = await _lilySearchRepository.retrieveAllLilyList();

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

        String? pos =
        item.containsKey('position') ? item['position']['value'] : null;
        String? currentPos =
        item.containsKey('position') ? item['position']['value'] : null;

        if (pos != null && currentPos != null) {
          for (final elm in res['results']['bindings']) {
            if (currentUri == elm['lily']['value'] &&
                currentPos != elm['position']['value'] &&
                pos != null) {
              pos += ", ${elm['position']['value']}";
            }
          }
        }

        resList.add(WordSearchModel(
            uri: item['lily']['value'],
            key: item['lily']['value'].split("/").last,
            name: item['name']['value'],
            nameKana: item.containsKey('nameKana') ? item['nameKana']['value'] : null,
            garden: item.containsKey('garden') ? item['garden']['value'] : null,
            position: pos));
      }

      _logger.finer('Return : ${resList.length}records.');
    } else {
      resList = List.empty();
    }

    return resList;
  }

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

        String? pos =
            item.containsKey('position') ? item['position']['value'] : null;
        String? currentPos =
            item.containsKey('position') ? item['position']['value'] : null;

        if (pos != null && currentPos != null) {
          for (final elm in res['results']['bindings']) {
            if (currentUri == elm['lily']['value'] &&
                currentPos != elm['position']['value'] &&
                pos != null) {
              pos += ", ${elm['position']['value']}";
            }
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
    Map<String, dynamic> resources = {};

    // List has value only when response has list of map
    if (res['@graph'].length != 0) {
      for (int i = 0; i < res['@graph'].length - 1; i++) {
        resources[res['@graph'][i]['@id']] = res['@graph'][i]['resource'];
      }

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

      String? grade = tmp['lily:grade'] != null
          ? tmp['lily:grade'] < 10
              ? tmp['lily:grade'] < 6
                  ? '初等部'
                  : '中等部 ${tmp['lily:grade'] - 6} 年'
              : '${tmp['lily:grade'] - 9} 年'
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
        grade: grade,
        height: tmp['height'] != null ? double.tryParse(tmp['height']) : null,
        isBoosted: tmp['lily:isBoosted'],
        legion: await _fetchLegionName(tmp['legion']),
        legionJobTitle: tmp['legionJobTitle'] is List<dynamic>
            ? tmp['legionJobTitle'].toList().join(', ')
            : tmp['legionJobTitle'],
        lifeStatus: tmp['lifeStatus'],
        rareSkill: tmp['rareSkill'],
        charm: await _createCharmList(tmp, resources),
        subSkill: tmp['subSkill'] is List<dynamic>
            ? tmp['subSkill'].join(', ')
            : tmp['subSkill'],
        type: tmp['@type'],
        weight: tmp['weight'] != null ? double.parse(tmp['weight']) : null,
      );
    }

    return resModel;
  }

  Future<String?>? _createCharmList(
      Map<String, dynamic> tmp, Map<String, dynamic> resources) async {
    String charmName;
    List<String> charms = [];

    if (tmp['charm'] != null) {
      if (tmp['charm'] is List<dynamic>) {
        await Future.forEach(
          tmp['charm'],
          (id) async => {
            if (resources.containsKey(id))
              {
                charmName =
                    await _linkedSearch(resources[id], SearchType.charmName),
                if (charmName != "")
                  {
                    charms.add(charmName),
                  },
              },
          },
        );
        return charms.join(', ');
      }
    } else {
      return null;
    }
  }

  Future<String?> _fetchLegionName(String? legion) async {
    if (legion != null) {
      return await _linkedSearch(legion, SearchType.legionName);
    } else {
      return null;
    }
  }

  /// Linked search with specified search [type] and search [key].
  Future<String> _linkedSearch(String key, SearchType type) async {
    late String rawRes;
    late final Map<String, dynamic> res;
    switch (type) {
      // Search charm name
      case SearchType.charmName:
        rawRes = await _lilySearchRepository.retrieveCharmInfo(key);
        res = jsonDecode(rawRes);

        _logger.finer(res.toString());

        if (res.containsKey('name')) {
          // Return charm name if query result has charm name.
          return res['name'] != null
              ? res['name']
                  .where((elm) => elm['@language'] == 'ja')
                  .toList()
                  .first['@value']
              : "";
        } else {
          // Otherwise, return empty string.
          return "";
        }
      case SearchType.legionName:
        rawRes = await _lilySearchRepository.retrieveLegionInfo(key);
        res = jsonDecode(rawRes);

        _logger.finer(res.toString());

        if (res.containsKey('name')) {
          // Return charm name if query result has charm name.
          return res['name'] != null
              ? res['name']
                  .where((elm) => elm['@language'] == 'ja')
                  .toList()
                  .first['@value']
              : "";
        } else {
          // Otherwise, return empty string.
          return "";
        }
      // Throw exception because of no such type defined.
      default:
        String title = "Something went wrong";
        String message = "Failed to retrieve information.¥nPlease try again.";
        _logger.severe("Failed to retrieve the data.");
        _logger.severe("Params -> Key: $key, SearchType: $type");
        _businessException.create(title, message);
        throw UnimplementedError("Type is not defined.");
    }
  }
}
