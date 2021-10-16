import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:simple_logger/simple_logger.dart';

class LilyDetailView extends ConsumerWidget {
  const LilyDetailView({Key? key}) : super(key: key);

  static MaterialPageRoute<LilyDetailView> createPageRoute(
      LilyModel? lilyModel) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(
        overrides: [
          lilyDetailViewModelProvider
              .overrideAs((watch) => lilyDetailViewModelFamily(lilyModel)),
        ],
        child: const LilyDetailView(),
      );
    });
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final lilyDetailViewMode = watch(lilyDetailViewModelProvider);
    final lilyDetailViewModelState = watch(lilyDetailViewMode.notifier);
    final logger = watch(loggerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return lilyDetailViewModelState.lily != null
                ? _buildDetailInfo(
                    context, lilyDetailViewModelState.lily!, logger)
                : const Center(
                    child: Text(
                      '一致するリリィは見つかりませんでした',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildDetailInfo(
      BuildContext context, LilyModel res, SimpleLogger logger) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
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
