import 'package:flutter/material.dart';
import 'package:lily_searcher/models/word_search/word_search_model.dart';
import 'package:lily_searcher/res/strings.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:lily_searcher/view_models/lily_list_view_model.dart';
import 'package:lily_searcher/views/lily_detail_view.dart';
import 'package:simple_logger/simple_logger.dart';

import 'exception_dialog.dart';

/// Create list tile for lily.
Widget repositoryTile(
    BuildContext context,
    WordSearchModel res,
    SimpleLogger logger,
    LilyListViewModel viewModel,
    BusinessException businessException) {
  return Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async => {
        logger.finer("${res.uri} taped"),
        logger.finer("Parameter: id:${res.key}"),

        // Search for detailed information on the selected Lily
        await viewModel.searchLilyDetail(res.key, context),

        if (businessException.hasException)
          {
            await showDialog(
              context: context,
              builder: (BuildContext context) =>
                  exceptionDialog(context, businessException, null),
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
