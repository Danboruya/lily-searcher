
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';

abstract class ILilySearchController {

  /// Search all lily.
  Future<List<WordSearchModel>> searchAll();

  /// Search DB with [word]
  Future<List<WordSearchModel>> wordSearch(String word);

  /// Search Lily detail from DB with search [key]
  Future<LilyModel> detailSearch(String key);
}
