import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';

class ThemeSelectView extends ConsumerWidget {
  const ThemeSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final themeSelectState = ref.watch(themeSelectorProvider);
    bool isSwitched = themeSelectState == ThemeMode.dark ? true : false;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'System settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Switch(
              value: isSwitched,
              onChanged: (value) {
                if (value == true) {
                  themeSelector.change(ThemeMode.dark);
                } else {
                  themeSelector.change(ThemeMode.light);
                }
              },
            ),
            title: const Text('Use Dark mode'),
          ),
        ],
      ),
    );
  }
}
