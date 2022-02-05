import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/models/charm/charm_list_model.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/providers/controller_providers.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/view_models/charm_list_view_model.dart';
import 'package:lily_searcher/view_models/lily_detail_view_model.dart';
import 'package:lily_searcher/view_models/lily_list_view_model.dart';

final lilyListViewModelProvider =
    StateNotifierProvider<LilyListViewModel, AsyncValue<List<WordSearchModel>>>(
  (ref) => LilyListViewModel(
    ref.read(lilySearchControllerProvider),
    ref.read(loggerProvider),
    ref.read(businessExceptionProvider),
  ),
);

final lilyDetailViewModelFamily =
    StateNotifierProvider.family<LilyDetailViewModel, LilyModel?, LilyModel?>(
  (ref, lily) =>
      LilyDetailViewModel(ref.read(lilySearchControllerProvider), lily),
);

final lilyDetailViewModelProvider =
    StateNotifierProvider<LilyDetailViewModel, LilyModel?>(
  (ref) => throw Error(),
);

final charmListViewModelProvider =
    StateNotifierProvider<CharmListViewModel, AsyncValue<List<CharmListModel>>>(
  (ref) => CharmListViewModel(
    ref.read(charmSearchControllerProvider),
    ref.read(loggerProvider),
    ref.read(businessExceptionProvider),
  ),
);
