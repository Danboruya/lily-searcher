import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/utils/enums.dart';
import 'package:lily_searcher/views/theme_select_view.dart';
import 'package:lily_searcher/views/lily_list.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);
  final _tab = <Widget>[
    const LilyListWidget(),
    const Text('Charm'),
    const Text('Legion')
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bottomNavigationBar = watch(bottomNavigationBarProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lily Searcher'),
      ),
      drawer: const ThemeSelectView(),
      body: _tab[bottomNavigationBar.state.index],
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
        currentIndex: bottomNavigationBar.state.index,
        onTap: (index) => {
          bottomNavigationBar.state = TabType.values[index],
        },
      ),
    );
  }
}
