import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Widget illustration;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ---------- Illustration ----------
          // Wrapped in a decorative circular background
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightSurfaceVariant.withValues(alpha: 0.5),
            ),
            child: Center(child: illustration),
          ),

          const SizedBox(height: AppSpacing.xxl * 1.5),

          // ---------- Text Content ----------
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.displayLarge?.copyWith(
              fontSize: 28, // Slightly smaller than 32 to fit long titles
              height: 1.2,
              fontWeight: FontWeight.w700,
              color: AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.lightTextSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
