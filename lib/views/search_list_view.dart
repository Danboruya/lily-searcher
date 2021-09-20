import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const SearchListViewer(),
    );
  }
}

class SearchListViewer extends ConsumerWidget {
  const SearchListViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchViewModelNotifier = watch(searchListViewModelProvider.notifier);
    final searchViewModelState = watch(searchListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 0, left: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '検索したいリリィ名を入力してください',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => searchViewModelNotifier
                        .searchLilyWithWord(),
                    icon: const Icon(Icons.send),
                  ),
                ),
                onChanged: (String? word) =>
                    searchViewModelNotifier.searchWord = word ?? "",
                onSubmitted: (_) => searchViewModelNotifier
                    .searchLilyWithWord(),
                autofocus: true,
              ),
            ),
            Expanded(
              child: searchViewModelState.when(
                data: (repositoryList) => repositoryList.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: repositoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _repositoryTile(repositoryList[index]);
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
      ),
    );
  }

  Widget _repositoryTile(String name) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
