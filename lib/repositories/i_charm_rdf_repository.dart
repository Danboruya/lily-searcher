abstract class ICharmRdfRepository {
  /// Retrieve charm list by specified [queryWord] or [queryKatakanaWord].
  Future<String> retrieveCharmList(String queryWord, String queryKatakanaWord);

  /// Retrieve all charm list.
  Future<String> retrieveAllCharmList();
}