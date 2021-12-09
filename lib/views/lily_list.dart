import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:lily_searcher/views/widgets/lily_list_tile.dart';

class LilyListWidget extends ConsumerWidget {
  const LilyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final lilyListViewModelNotifier = watch(lilyListViewModelProvider.notifier);
    final lilyListViewModelState = watch(lilyListViewModelProvider);
    final logger = watch(loggerProvider);
    final businessException = watch(businessExceptionProvider);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 14, right: 16, bottom: 0, left: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: '検索したいリリィ名を入力してください',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () =>
                      lilyListViewModelNotifier.searchLilyWithWord(),
                  icon: const Icon(Icons.search),
                ),
              ),
              onChanged: (String? word) =>
                  lilyListViewModelNotifier.searchWord = word ?? "",
              onSubmitted: (_) =>
                  lilyListViewModelNotifier.searchLilyWithWord(),
              autofocus: false,
            ),
          ),
          Expanded(
            child: lilyListViewModelState.when(
              data: (res) => res.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: res.length,
                      itemBuilder: (BuildContext context, int index) {
                        return repositoryTile(context, res[index], logger,
                            lilyListViewModelNotifier, businessException);
                      },
                    )
                  : const Center(
                      child: Text(
                        '一致するリリィは見つかりませんでした',
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
