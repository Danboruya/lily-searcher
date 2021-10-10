/// Search management repository for assaultlily-rdf
abstract class ILilyRdfRepository {
  /// Retrieve lily list by specified [queryCond] word.
  Future<String> retrieveLilyList(String queryCond);

  /// Retrieve lily detail by specified [key].
  Future<String> retrieveLilyDetail(String key);
}
