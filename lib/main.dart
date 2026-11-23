import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('settings');
  final box = Hive.box('settings');
  debugPrint('Saved theme: ${box.get('themeMode', defaultValue: 0)}');

  runApp(ProviderScope(child: const RepTrackApp()));
}
