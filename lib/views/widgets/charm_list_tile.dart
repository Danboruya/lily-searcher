import 'package:flutter/material.dart';
import 'package:lily_searcher/models/charm/charm_list_model.dart';
import 'package:lily_searcher/res/strings.dart';
import 'package:lily_searcher/utils/business_exception.dart';
import 'package:lily_searcher/view_models/charm_list_view_model.dart';
import 'package:simple_logger/simple_logger.dart';

import 'exception_dialog.dart';

/// Create list tile for charm.
Widget repositoryTile(
    BuildContext context,
    CharmListModel res,
    SimpleLogger logger,
    CharmListViewModel viewModel,
    BusinessException businessException) {
  return Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      // onTap: () async => {
      //   logger.finer("${res.uri} taped"),
      //   logger.finer("Parameter: id:${res.key}"),
      //
      //   // Search for detailed information on the selected Charm
      // },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(
            Icons.sports_cricket,
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
                    res.productId ?? noInfoLbl,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    res.seriesName ?? noInfoLbl,
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
