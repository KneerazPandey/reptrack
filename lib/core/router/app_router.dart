import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:reptrack/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: 'onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const _PlaceholderScreen('Home'),
      ),
    ],
  );

  static String resolveStartRoute() {
    final profileBox = Hive.box('user_profile');
    final hasProfile =
        profileBox.get('name') != null &&
        (profileBox.get('name') as String).isNotEmpty;
    return hasProfile ? AppRoutes.home : AppRoutes.onboarding;
  }
}

// Minimal placeholder so the app compiles before other screens exist.
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
