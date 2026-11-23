import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/provider/theme_notifier.dart';
import 'package:reptrack/core/router/app_router.dart';
import 'package:reptrack/core/theme/app_theme.dart';

class RepTrackApp extends ConsumerWidget {
  const RepTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
