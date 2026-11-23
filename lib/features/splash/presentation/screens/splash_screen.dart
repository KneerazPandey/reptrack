import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';

import '../widgets/animated_logo.dart';

import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _textController;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  _SplashPhase _phase = _SplashPhase.animating;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textFade = CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    );
    _textSlide = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    _boot();
  }

  Future<void> _boot() async {
    try {
      _textController.forward();
      // await BootstrapService.instance.initialize();

      // Minimum display time for the splash
      await Future.delayed(const Duration(milliseconds: 2200));

      if (!mounted) return;
      _phase = _SplashPhase.ready;
      if (_phase == _SplashPhase.ready) {
        context.go(AppRoutes.welcome);
      }
    } catch (e, st) {
      debugPrint('[Splash] Bootstrap failed: $e\n$st');
      if (!mounted) return;
      setState(() {
        _phase = _SplashPhase.error;
        _errorMessage = 'Could not start app. Please try again.';
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The dark background gradient
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.splashBackgroundTop,
              AppColors.splashBackgroundBottom,
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),

              // ---------- Logo ----------
              const AnimatedLogo(size: 120),
              const SizedBox(height: AppSpacing.xl),

              // ---------- Wordmark + Tagline ----------
              FadeTransition(
                opacity: _textFade,
                child: SlideTransition(
                  position: _textSlide,
                  child: Column(
                    children: [
                      Text(
                        'RepTrack',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w800, // Extra bold
                          color: Colors.white,
                          letterSpacing: -1.0,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Track. Lift. Progress.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.7),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(flex: 4),

              // ---------- Status / Error ----------
              _buildFooter(),

              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    if (_phase == _SplashPhase.error) {
      return Column(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            _errorMessage ?? 'Something went wrong.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: _retry,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white54),
            ),
            child: const Text('Retry'),
          ),
        ],
      );
    }

    // Loading state
    return Column(
      children: [
        // Custom purple spinner ring
        SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            color: Colors.white,
            backgroundColor: Colors.white.withValues(alpha: 0.15),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl), // Spacing before version
        Text(
          'v1.0.0',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  void _retry() {
    setState(() {
      _phase = _SplashPhase.animating;
      _errorMessage = null;
    });
    _boot();
  }
}

enum _SplashPhase { animating, ready, error }
