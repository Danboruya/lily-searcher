import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSelecter extends StateNotifier<ThemeMode> {
  ThemeSelecter() : super(ThemeMode.system) {
    init();
  }

  /// Unique Key of SharedPreferences
  static const themePrefsKey = 'selectedTheme';

  /// On initialized step at created this object.
  Future init() async {
    final themeIndex = await _themeIndex;
    state = ThemeMode.values.firstWhere(
      (elm) => elm.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  /// On change the [theme] data from screen.
  Future<void> change(ThemeMode theme) async {
    await _save(theme.index);
    state = theme;
  }

  /// Fetch current theme from `SharedPreferences`.
  Future<int?> get _themeIndex async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themePrefsKey);
  }

  /// Store the selected [themeIndex] to `SharedPrefences`.
  Future<void> _save(int themIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themePrefsKey, themIndex);
  }
}
