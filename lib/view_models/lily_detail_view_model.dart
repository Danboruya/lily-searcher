import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controller/lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';

/// ViewModel for SearchList view.
class LilyDetailViewModel extends StateNotifier<AsyncValue<LilyModel>> {
  LilyDetailViewModel(this._lilySearchController)
      : super(const AsyncValue.loading());

  /// Search controller object
  final LilySearchController _lilySearchController;

  /// Search Lily from database with specified [key]
  Future<void> searchLilyDetail(key) async {
    state = const AsyncValue.loading();
    try {
      // Retrieve Lily detail data by specified search key
      final LilyModel res = await _lilySearchController.detailSearch(key);
      state = AsyncValue.data(res);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
