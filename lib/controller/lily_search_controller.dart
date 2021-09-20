import 'dart:convert';

import 'package:lily_searcher/controller/i_lily_search_controller.dart';
import 'package:lily_searcher/repositories/lily_rdf_repository.dart';
import 'package:simple_logger/simple_logger.dart';

class LilySearchController implements ILilySearchController {
  LilySearchController(this._lilySearchRepository, this._logger);

  final LilyRdfRepository _lilySearchRepository;
  final SimpleLogger _logger;

  /// Search lily with specified search word
  @override
  Future<List<String>> wordSearch(String word) async {
    final rawRes = await _lilySearchRepository.simpleLilySearch(word);

    final Map<String, dynamic> res = jsonDecode(rawRes);
    _logger.finer(res.toString());

    List<String> resList = [];

    // List has value only when response has list of map
    if (res['results']['bindings'].length != 0) {
      for (final item in res['results']['bindings']) {
        resList.add(item['name']['value']);
      }
    } else {
      resList = List.empty();
    }

    return resList;
  }
}
