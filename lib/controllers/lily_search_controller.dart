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
            nameKana:
                item.containsKey('nameKana') ? item['nameKana']['value'] : null,
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
            nameKana:
                item.containsKey('nameKana') ? item['nameKana']['value'] : null,
            garden: item.containsKey('garden') ? item['garden']['value'] : null,
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
    if (res.containsKey('@graph')) {
      if (res['@graph'].length != 0) {
        for (int i = 0; i < res['@graph'].length - 1; i++) {
          resources[res['@graph'][i]['@id']] = res['@graph'][i]['resource'];
        }

        tmp = res['@graph'].last;

        // Extract lily's birthday
        DateTime? birthDay = _extractBirthday(tmp['birthDate']);

        // Extract lily's grade
        String? grade = _extractGrade(tmp['lily:grade']);

        resModel = LilyModel(
          key: key,
          name: tmp['label'],
          nameKana: tmp['nameKana']['@value'],
          birthDay: birthDay,
          age: tmp['foaf:age'],
          garden: tmp['garden'],
          position: tmp['position'] is List<dynamic>
              ? tmp['position'].toList().join(', ')
              : tmp['position'],
          anotherName: _extractAnotherName(tmp['anotherName']),
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
    } else {
      // Extract lily's birthday
      DateTime? birthDay = res.containsKey('birthDate')
          ? _extractBirthday(res['birthDate'])
          : null;

      // Extract lily's grade
      String? grade = res.containsKey('lily:grade')
          ? _extractGrade(res['lily:grade'])
          : null;

      return LilyModel(
        key: key,
        name: res['label'],
        nameKana:
            res.containsKey('nameKana') ? res['nameKana']['@value'] : null,
        birthDay: birthDay,
        age: res.containsKey('foaf:age') ? res['foaf:age'] : null,
        garden: res['garden'],
        position: res.containsKey('position')
            ? res['position'] is List<dynamic>
                ? res['position'].toList().join(', ')
                : res['position']
            : null,
        anotherName: _extractAnotherName(res['anotherName']),
        birthPlace: res['birthPlace'] != null
            ? res['birthPlace']
                .where((elm) => elm['@language'] == 'ja')
                .toList()
                .first['@value']
            : null,
        bloodType: res['bloodType'],
        boostedSkill: res.containsKey('boostedSkill')
            ? res['boostedSkill'] is List<dynamic>
                ? res['boostedSkill'].toList().join(', ')
                : res['boostedSkill']
            : null,
        grade: grade,
        height: res['height'] != null ? double.tryParse(res['height']) : null,
        isBoosted: res['lily:isBoosted'],
        legion: await _fetchLegionName(res['legion']),
        legionJobTitle: res['legionJobTitle'] is List<dynamic>
            ? res['legionJobTitle'].toList().join(', ')
            : res['legionJobTitle'],
        lifeStatus: res['lifeStatus'],
        rareSkill: res['rareSkill'],
        charm: await _createCharmList(res, resources),
        subSkill: res['subSkill'] is List<dynamic>
            ? res['subSkill'].join(', ')
            : res['subSkill'],
        type: res['@type'],
        weight: res['weight'] != null ? double.parse(res['weight']) : null,
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
      } else {
        return await _linkedSearch(resources[tmp['charm']], SearchType.charmName);
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

  /// Extract birthday from birthdate property response
  DateTime? _extractBirthday(String? birthdate) {
    return birthdate != null
        ? DateTime(
            1970,
            int.parse(birthdate.split('-')[birthdate.split('-').length - 1]),
            int.parse(birthdate.split('-')[birthdate.split('-').length - 2]))
        : null;
  }

  /// Extract grade from response map
  String? _extractGrade(int? gradeNum) {
    return gradeNum != null
        ? gradeNum < 10
            ? gradeNum < 6
                ? '初等部'
                : '中等部 ${gradeNum - 6} 年'
            : '${gradeNum - 9} 年'
        : null;
  }

  /// Extract another name from response map
  String? _extractAnotherName(dynamic anotherNames) {
    List tmp = [];
    if (anotherNames != null && anotherNames is List<dynamic>) {
      for (var e in anotherNames) {
        tmp.add(e['@value']);
      }
      return tmp.join(', ');
    } else if (anotherNames != null) {
      return anotherNames['@value'];
    } else {
      return null;
    }
  }
}
