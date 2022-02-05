import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:lily_searcher/views/widgets/charm_list_tile.dart';

class CharmListWidget extends ConsumerWidget {
  const CharmListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charmListViewModelNotifier = ref.watch(charmListViewModelProvider.notifier);
    final charmListViewModelState = ref.watch(charmListViewModelProvider);
    final logger = ref.watch(loggerProvider);
    final businessException = ref.watch(businessExceptionProvider);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 14, right: 16, bottom: 0, left: 16),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '検索したいCHARM名を入力してください',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () =>
                      charmListViewModelNotifier.searchLilyWithWord(),
                  icon: const Icon(Icons.search),
                ),
              ),
              initialValue: charmListViewModelNotifier.searchWord,
              onChanged: (String? word) =>
              charmListViewModelNotifier.searchWord = word ?? "",
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (_) => {
                charmListViewModelNotifier.searchLilyWithWord(),
              },
              autofocus: false,
            ),
          ),
          Expanded(
            child: charmListViewModelState.when(
              data: (res) => res.isNotEmpty
                  ? ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: res.length,
                itemBuilder: (BuildContext context, int index) {
                  return repositoryTile(context, res[index], logger,
                      charmListViewModelNotifier, businessException);
                },
              )
                  : const Center(
                child: Text(
                  '一致するCHARMは見つかりませんでした',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Text(error.toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
