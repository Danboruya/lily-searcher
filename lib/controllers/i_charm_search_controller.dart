import 'package:lily_searcher/models/charm/charm_list_model.dart';

abstract class ICharmSearchController {

  /// Search all charm.
  Future<List<CharmListModel>> searchAll();

  /// Search DB with [word].
  Future<List<CharmListModel>> wordSearch(String word);

  /// Search Charm detail from DB with search [key].
  // Future<CharmListModel> detailSearch(String key);
}