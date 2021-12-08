/// Search management repository for assaultlily-rdf
abstract class ILilyRdfRepository {
  /// Retrieve lily list by specified [queryCond] word.
  Future<String> retrieveLilyList(String queryCond);

  /// Retrieve all lily list.
  Future<String> retrieveAllLilyList();

  /// Retrieve lily detail by specified [key].
  Future<String> retrieveLilyDetail(String key);

  /// Retrieve charm detail information which has specified [charmId].
  Future<String> retrieveCharmInfo(String charmId);

  /// Retrieve Legion detail information which has specified [legionId].
  Future<String> retrieveLegionInfo(String legionId);
}
