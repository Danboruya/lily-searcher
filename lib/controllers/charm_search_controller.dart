import 'dart:convert';

import 'package:kana_kit/kana_kit.dart';
import 'package:lily_searcher/controllers/i_charm_search_controller.dart';
import 'package:lily_searcher/models/charm/charm_list_model.dart';
import 'package:lily_searcher/repositories/charm_rdf_repository.dart';
import 'package:simple_logger/simple_logger.dart';

class CharmSearchController implements ICharmSearchController {
  CharmSearchController(this._charmRdfRepository, this._kanaKit, this._logger);

  final CharmRdfRepository _charmRdfRepository;
  final SimpleLogger _logger;
  final KanaKit _kanaKit;

  @override
  Future<List<CharmListModel>> searchAll() async {
    final rawRes = await _charmRdfRepository.retrieveAllCharmList();

    final Map<String, dynamic> res = jsonDecode(rawRes);
    _logger.finer(res.toString());

    List<CharmListModel> resList = [];

    // List has value only when response has list of map
    if (res['results']['bindings'].length != 0) {
      String currentUri = "";

      for (final item in res['results']['bindings']) {
        if (currentUri != item['charm']['value']) {
          currentUri = item['charm']['value'];
        } else {
          continue;
        }

        resList.add(CharmListModel(
          key: item['charm']['value'].split("/").last,
          name: item['name']['value'],
          generation:
              item.containsKey('nameKana') ? item['generation']['value'] : null,
          seriesName: item.containsKey('seriesName')
              ? item['seriesName']['value']
              : null,
          productId:
              item.containsKey('productID') ? item['productID']['value'] : null,
        ));
      }

      _logger.finer('Return : ${resList.length}records.');
    } else {
      resList = List.empty();
    }

    return resList;
  }

  @override
  Future<List<CharmListModel>> wordSearch(String word) async {
    final String katakanaWord = _kanaKit.toKatakana(word);
    final rawRes =
        await _charmRdfRepository.retrieveCharmList(word, katakanaWord);

    final Map<String, dynamic> res = jsonDecode(rawRes);
    _logger.finer(res.toString());

    List<CharmListModel> resList = [];

    // List has value only when response has list of map
    if (res['results']['bindings'].length != 0) {
      String currentUri = "";

      for (final item in res['results']['bindings']) {
        if (currentUri != item['charm']['value']) {
          currentUri = item['charm']['value'];
        } else {
          continue;
        }

        resList.add(CharmListModel(
          key: item['charm']['value'].split("/").last,
          name: item['name']['value'],
          generation:
              item.containsKey('nameKana') ? item['generation']['value'] : null,
          seriesName: item.containsKey('seriesName')
              ? item['seriesName']['value']
              : null,
          productId:
              item.containsKey('productID') ? item['productID']['value'] : null,
        ));
      }

      _logger.finer('Return : ${resList.length}records.');
    } else {
      resList = List.empty();
    }

    return resList;
  }
}
