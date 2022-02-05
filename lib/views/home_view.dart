import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/utils/enums.dart';
import 'package:lily_searcher/views/charm_list_view.dart';
import 'package:lily_searcher/views/lily_list_view.dart';
import 'package:lily_searcher/views/app_config_view.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);
  final _tab = <Widget>[
    const LilyListWidget(),
    const CharmListWidget(),
    const Text('Legion')
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationBar = ref.watch(bottomNavigationBarProvider);
    final bottomNavigationBarState =
        ref.watch(bottomNavigationBarProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      drawer: const AppConfigView(),
      body: _tab[bottomNavigationBar.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Lily',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: 'Charm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Legion',
          ),
        ],
        currentIndex: bottomNavigationBar.index,
        onTap: (index) => {
          bottomNavigationBarState.state = TabType.values[index],
        },
      ),
    );
  }
}
