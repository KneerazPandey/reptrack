import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/theme/theme_extensions.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';
import 'package:reptrack/features/welcome/presentation/widgets/welcome_ring_painter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------- Header (Logo & Name) ----------
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.fitness_center_rounded,
                      color: context.colors.onPrimary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'RepTrack',
                    style: TextStyle(
                      color: context.colors.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),

              Spacer(),

              // ---------- Main Rep Counter Graphic ----------
              Center(
                child: SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 280,
                        height: 280,
                        child: CustomPaint(
                          painter: WelcomeRingPainter(
                            progress: 0.75,
                            strokeWidth: 12,
                            activeColor: context.colors.primary,
                            inactiveColor:
                                context.colors.surfaceContainerHighest,
                          ),
                        ),
                      ),

                      // Center Content
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '12',
                            style: TextStyle(
                              color: context.colors.onSurface,
                              fontSize: 84,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                              letterSpacing: -2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'FULL REPS',
                            style: TextStyle(
                              color: context.colors.onSurfaceVariant,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Partial Reps Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.info,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '+3 partial',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Spacer(),

              // ---------- Text Content ----------
              Text(
                'Count every rep.\nOwn every set.',
                style: TextStyle(
                  color: context.colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Splits, sets, partial reps and rest timers.\nWorks fully offline. No ads, no tracking.',
                style: TextStyle(
                  color: context.colors.onSurfaceVariant,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // ---------- CTA Button ----------
              RepTrackElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.profileSetup);
                },
                name: 'Get started',
              ),

              const SizedBox(height: AppSpacing.md),

              // ---------- Footer Text ----------
              Center(
                child: Text(
                  'All data stays on this phone.',
                  style: TextStyle(
                    color: context.colors.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
