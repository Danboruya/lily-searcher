import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controllers/charm_search_controller.dart';
import 'package:lily_searcher/models/charm/charm_list_model.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:simple_logger/simple_logger.dart';

/// ViewModel for SearchList view.
class CharmListViewModel
    extends StateNotifier<AsyncValue<List<CharmListModel>>> {
  CharmListViewModel(
      this._charmSearchController, this._logger, this._businessException)
      : super(const AsyncValue.loading()) {
    searchInitCharmList();
  }

  /// Search controller object
  final CharmSearchController _charmSearchController;

  final BusinessException _businessException;

  final SimpleLogger _logger;

  /// word string on text box
  String searchWord = "";

  /// detail of lily
  LilyModel? _lily;

  LilyModel? get lily => _lily;

  /// Search all Lily from database.
  Future<void> searchInitCharmList() async {
    state = const AsyncValue.loading();
    try {
      late List<CharmListModel> res;
      res = await _charmSearchController.searchAll();
      state = AsyncValue.data(res);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }

  /// Search Charm from database with specified [searchWord]
  Future<void> searchLilyWithWord() async {
    state = const AsyncValue.loading();
    try {
      late List<CharmListModel> res;
      // When word is empty or only has whitespace,
      if (searchWord.isEmpty || searchWord.trim().isEmpty) {
        res = await _charmSearchController.searchAll();
      } else {
        // Retrieve Lily data by inputted word on SearchList view
        res = await _charmSearchController.wordSearch(searchWord);
      }
      state = AsyncValue.data(res);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }

  /// Search Charm from database with specified [key]
  // Future<void> searchLilyDetail(key, BuildContext context) async {
  //   try {
  //     // Retrieve Lily detail data by specified search key
  //     _lily = await CharmListModel.detailSearch(key);
  //   } on Exception catch (error) {
  //     _logger.shout(error);
  //     _lily = null;
  //     if (_businessException.hasException == false) {
  //       _businessException.create(
  //           "Failed to retrieve the data", error.toString());
  //     }
  //   }
  // }
}
