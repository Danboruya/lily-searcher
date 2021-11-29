import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/controllers/lily_search_controller.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';

/// ViewModel for SearchList view.
class LilyDetailViewModel extends StateNotifier<LilyModel?> {
  LilyDetailViewModel(this._lilySearchController, LilyModel? lily)
      : super(lily);

  /// Search controller object
  final LilySearchController _lilySearchController;

  LilyModel? get lily => state;
}
