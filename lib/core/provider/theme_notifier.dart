import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_ui/material_ui.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _loadFromStorage();
  }

  void _loadFromStorage() {
    // Safety check: If Hive isn't ready, stay on system default
    if (!Hive.isBoxOpen('settings')) {
      debugPrint('Hive settings box not open, defaulting to System theme');
      return;
    }

    final box = Hive.box('settings');

    // Get the saved index, default to 0 (System) if nothing is saved
    final savedIndex = box.get('themeMode', defaultValue: 0) as int;

    // Safety check: Ensure the saved index is valid (0, 1, or 2)
    if (savedIndex >= 0 && savedIndex < ThemeMode.values.length) {
      state = ThemeMode.values[savedIndex];
      debugPrint('Loaded ThemeMode: ${state.name}');
    } else {
      state = ThemeMode.system; // Fallback if corrupted
    }
  }

  void setTheme(ThemeMode mode) {
    // 1. Update the state (this rebuilds the app immediately)
    state = mode;

    // 2. Save to Hive persistently
    if (Hive.isBoxOpen('settings')) {
      Hive.box('settings').put('themeMode', mode.index);
      debugPrint('Saved ThemeMode: ${mode.name} (index: ${mode.index})');
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
