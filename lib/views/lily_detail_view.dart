import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lily_searcher/models/lily/lily_model.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/providers/view_model_providers.dart';
import 'package:lily_searcher/res/strings.dart';
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
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 70.0,
              color: Colors.grey,
            ),
            title: Text(
              res.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              res.nameKana ?? noInfoLbl,
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('所属ガーデン'),
            ),
            title: Text(
              res.garden ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('学年'),
            ),
            title: Text(
              res.grade ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('所属レギオン'),
            ),
            title: Text(
              res.legion ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('レギオン役職'),
            ),
            title: Text(
              res.legionJobTitle ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('ポジション'),
            ),
            title: Text(
              res.position ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('レアスキル'),
            ),
            title: Text(
              res.rareSkill ?? noInfoLbl,
            ),
          ),
          if (res.isBoosted == true)
            ListTile(
              leading: const SizedBox(
                width: 100,
                child: Text('ブーステッドスキル'),
              ),
              title: Text(
                res.boostedSkill ?? noInfoLbl,
              ),
            ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('血液型'),
            ),
            title: Text(
              res.bloodType ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('二つ名'),
            ),
            title: Text(
              res.anotherName ?? noInfoLbl,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('誕生日'),
            ),
            title: Text(
              res.birthDay == null
                  ? noInfoLbl
                  : (DateFormat('MM/dd')).format(res.birthDay!),
            ),
          ),
          ListTile(
            leading: const SizedBox(
              width: 100,
              child: Text('使用チャーム'),
            ),
            title: Text(
              res.charm ?? noInfoLbl,
            ),
          ),
        ],
      ),
    );
  }
}
