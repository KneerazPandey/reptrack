import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:reptrack/features/profile_setup/first_split/presentation/screens/pick_split_screen.dart';
import 'package:reptrack/features/profile_setup/profile/presentation/screens/profile_setup_screen.dart';
import 'package:reptrack/features/profile_setup/timer_and_goals/presentation/screens/timer_and_goals_screen.dart';
import 'package:reptrack/features/profile_setup/units_and_bodyweight/presentation/screens/units_and_bodyweight_screen.dart';
import 'package:reptrack/features/splash/presentation/screens/splash_screen.dart';
import 'package:reptrack/features/welcome/presentation/screens/welcome_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.welcome,
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
        builder: (BuildContext context, GoRouterState state) =>
            OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const _PlaceholderScreen('Home'),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: 'Welcome',
        builder: (BuildContext context, GoRouterState state) => WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.profileSetup,
        name: 'Proifle Setup',
        builder: (BuildContext context, GoRouterState state) =>
            ProfileSetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.unitsAndBodyweight,
        name: 'Units and Bodyweight',
        builder: (BuildContext context, GoRouterState state) =>
            UnitsAndBodyweightScreen(),
      ),
      GoRoute(
        path: AppRoutes.timerAndGoals,
        name: 'Reset Timer and Weekly Goals',
        builder: (BuildContext context, GoRouterState state) =>
            TimerAndGoalsScreen(),
      ),
      GoRoute(
        path: AppRoutes.pickSplit,
        name: 'Pick Split',
        builder: (BuildContext context, GoRouterState state) =>
            PickSplitScreen(),
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
