import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/providers/controller_providers.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/view_models/lily_detail_view_model.dart';
import 'package:lily_searcher/view_models/search_list_view_model.dart';

final searchListViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => SearchListViewModel(ref.read(lilySearchControllerProvider),
      ref.read(loggerProvider)),
);

final lilyDetailViewModelFamily =
    StateNotifierProvider.family<LilyDetailViewModel, LilyModel?, LilyModel?>(
  (ref, lily) =>
      LilyDetailViewModel(ref.read(lilySearchControllerProvider), lily),
);

final lilyDetailViewModelProvider =
    ScopedProvider<StateNotifierProvider<LilyDetailViewModel, LilyModel?>>(
        (ref) => throw Error());
