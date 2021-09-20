/// Search management repository for assaultlily-rdf
abstract class ILilyRdfRepository {
  Future<String> simpleLilySearch(String queryWord);
}
