import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
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
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('所属ガーデン'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.garden}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('ポジション'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.position}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('レアスキル'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.rareSkill}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('レギオン'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.legion}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                if (res.isBoosted == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('ブーステッドスキル'),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          '${res.boostedSkill}',
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('血液型'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.bloodType}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('二つ名'),
                    const SizedBox(width: 20),
                    Text(
                      '${res.anotherName}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('誕生日'),
                    const SizedBox(width: 20),
                    Text(
                      res.birthDay == null
                          ? 'N/A'
                          : (DateFormat('MM/dd')).format(res.birthDay!),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('使用チャーム'),
                    const SizedBox(width: 20),
                    Text(res.charm ?? 'N/A'),
                  ],
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
