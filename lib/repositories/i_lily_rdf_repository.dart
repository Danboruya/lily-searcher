import 'package:lily_searcher/utils/enums.dart';

/// Search management repository for assaultlily-rdf
abstract class ILilyRdfRepository {
  /// Retrieve lily list by specified [queryCond] word.
  Future<String> retrieveLilyList(String queryCond);

  /// Retrieve lily detail by specified [key].
  Future<String> retrieveLilyDetail(String key);

  /// Retrieve lily detail data by specified [key] based on search [type]
  Future<String> linkedSearch(String key, SearchType type);
}
