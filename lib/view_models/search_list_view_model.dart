import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controller/lily_search_controller.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';

/// ViewModel for SearchList view.
class SearchListViewModel
    extends StateNotifier<AsyncValue<List<WordSearchModel>>> {
  SearchListViewModel(this._lilySearchController)
      : super(const AsyncValue.loading());

  /// Search controller object
  final LilySearchController _lilySearchController;

  /// word string on text box
  String searchWord = "";

  /// Search Lily from database with specified [searchWord]
  Future<void> searchLilyWithWord() async {
    // When word is empty or only has whitespace,
    if (searchWord.isEmpty || searchWord.trim().isEmpty) {
      return;
    }

    state = const AsyncValue.loading();
    try {
      // Retrieve Lily data by inputted word on SearchList view
      final List<WordSearchModel> res =
          await _lilySearchController.wordSearch(searchWord);
      state = AsyncValue.data(res);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
