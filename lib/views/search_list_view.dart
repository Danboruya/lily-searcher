import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:simple_logger/src/simple_logger.dart';

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
    final logger = watch(loggerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 14, right: 16, bottom: 0, left: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '検索したいリリィ名を入力してください',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        searchViewModelNotifier.searchLilyWithWord(),
                    icon: const Icon(Icons.send),
                  ),
                ),
                onChanged: (String? word) =>
                    searchViewModelNotifier.searchWord = word ?? "",
                onSubmitted: (_) =>
                    searchViewModelNotifier.searchLilyWithWord(),
                autofocus: true,
              ),
            ),
            Expanded(
              child: searchViewModelState.when(
                data: (res) => res.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: res.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _repositoryTile(res[index], logger);
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

  Widget _repositoryTile(WordSearchModel res, SimpleLogger logger) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {
          logger.finer("${res.uri} taped"),
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 70.0,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  res.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      res.nameKana,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '${res.garden}, (${res.position})',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return ;
  }
}
