import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controllers/lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:simple_logger/simple_logger.dart';

/// ViewModel for SearchList view.
class SearchListViewModel
    extends StateNotifier<AsyncValue<List<WordSearchModel>>> {
  SearchListViewModel(this._lilySearchController, this._logger)
      : super(const AsyncValue.loading());

  /// Search controller object
  final LilySearchController _lilySearchController;

  final SimpleLogger _logger;

  /// word string on text box
  String searchWord = "";

  /// detail of lily
  LilyModel? _lily;

  LilyModel? get lily => _lily;

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

  /// Search Lily from database with specified [key]
  Future<void> searchLilyDetail(key, BuildContext context) async {
    try {
      // Retrieve Lily detail data by specified search key
      _lily = await _lilySearchController.detailSearch(key);
    } on Exception catch (error) {
      _logger.shout(error);
      _lily = null;
      context
          .read(businessExceptionProvider)
          .create("Failed to retrieve the data", error.toString());
    }
  }
}
