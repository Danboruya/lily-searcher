import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/view_models/search_list_view_model.dart';
import 'package:lily_searcher/providers/controller_providers.dart';

final searchListViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => SearchListViewModel(ref.read(lilySearchControllerProvider)),
);
