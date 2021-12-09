import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controllers/lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:simple_logger/simple_logger.dart';

/// ViewModel for SearchList view.
class LilyListViewModel
    extends StateNotifier<AsyncValue<List<WordSearchModel>>> {
  LilyListViewModel(this._lilySearchController, this._logger)
      : super(const AsyncValue.loading()) {
    searchInitLilyList();
  }

  /// Search controller object
  final LilySearchController _lilySearchController;

  final SimpleLogger _logger;

  /// word string on text box
  String searchWord = "";

  /// detail of lily
  LilyModel? _lily;

  LilyModel? get lily => _lily;

  /// Search all Lily from database.
  Future<void> searchInitLilyList() async {
    state = const AsyncValue.loading();
    try {
      late List<WordSearchModel> res;
      res = await _lilySearchController.searchAll();
      state = AsyncValue.data(res);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }

  /// Search Lily from database with specified [searchWord]
  Future<void> searchLilyWithWord() async {
    state = const AsyncValue.loading();
    try {
      late List<WordSearchModel> res;
      // When word is empty or only has whitespace,
      if (searchWord.isEmpty || searchWord.trim().isEmpty) {
        res = await _lilySearchController.searchAll();
      } else {
        // Retrieve Lily data by inputted word on SearchList view
        res = await _lilySearchController.wordSearch(searchWord);
      }
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
      if (context.read(businessExceptionProvider).hasException == false) {
        context
            .read(businessExceptionProvider)
            .create("Failed to retrieve the data", error.toString());
      }
    }
  }
}
