import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:lily_searcher/res/strings.dart';
import 'package:lily_searcher/view_models/search_list_view_model.dart';
import 'package:lily_searcher/views/theme_select_view.dart';
import 'package:lily_searcher/views/widgets/exception_dialog.dart';
import 'package:simple_logger/simple_logger.dart';

import 'lily_detail_view.dart';

class SearchListView extends ConsumerWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final searchViewModelNotifier = watch(searchListViewModelProvider.notifier);
    final searchViewModelState = watch(searchListViewModelProvider);
    final logger = watch(loggerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      drawer: const ThemeSelectView(),
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
                          return _repositoryTile(context, res[index], logger,
                              searchViewModelNotifier);
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

  Widget _repositoryTile(BuildContext context, WordSearchModel res,
      SimpleLogger logger, SearchListViewModel viewModel) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async => {
          logger.finer("${res.uri} taped"),
          logger.finer("Parameter: id:${res.key}"),

          // Search for detailed information on the selected Lily
          await viewModel.searchLilyDetail(res.key, context),

          if (context.read(businessExceptionProvider).hasException)
            {
              await showDialog(
                context: context,
                builder: (BuildContext context) =>
                    exceptionDialog(context, null),
              ),
            }
          else
            {
              // Screen transition only when search results would be not null
              if (viewModel.lily != null)
                {
                  Navigator.of(context)
                      .push(LilyDetailView.createPageRoute(viewModel.lily)),
                },
            },
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
                      res.nameKana ?? noInfoLbl,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '${res.garden ?? noInfoLbl}, (${res.position ?? noInfoLbl})',
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
