import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';
import 'package:lily_searcher/res/theme_dark_data.dart';
import 'package:lily_searcher/res/theme_light_data.dart';
import 'package:lily_searcher/views/search_list_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = useProvider(themeSelecterProvider);

    return MaterialApp(
      theme: themeMode == ThemeMode.dark ? darkThemeData : lightThemeData,
      darkTheme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
      home: const SearchListView(),
    );
  }
}
