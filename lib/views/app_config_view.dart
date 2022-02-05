import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/res/strings.dart';
import 'package:package_info/package_info.dart';

class AppConfigView extends ConsumerWidget {
  const AppConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final themeSelectState = ref.watch(themeSelectorProvider);
    bool isSwitched = themeSelectState == ThemeMode.dark ? true : false;

    late PackageInfo info;

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
          ListTile(
            title: const Text('Licences'),
            onTap: () async => {
              if (kIsWeb == false) {
                info = await PackageInfo.fromPlatform(),
                showLicensePage(
                  context: context,
                  applicationName: info.appName,
                  applicationVersion: info.version,
                  applicationIcon: const Icon(Icons.search),
                  applicationLegalese: copyRightLbl,
                ),
              } else {
                showLicensePage(
                  context: context,
                  applicationName: appNameLbl,
                  applicationVersion: webVersionLbl,
                  applicationIcon: const Icon(Icons.search),
                  applicationLegalese: copyRightLbl,
                ),
              }
            },
          )
        ],
      ),
    );
  }
}
