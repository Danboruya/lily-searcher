import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';

class ThemeSelectView extends ConsumerWidget {
  const ThemeSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final themeSelecter = watch(themeSelecterProvider.notifier);
    final themeSelectState = watch(themeSelecterProvider);
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
                  themeSelecter.change(ThemeMode.dark);
                } else {
                  themeSelecter.change(ThemeMode.light);
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
