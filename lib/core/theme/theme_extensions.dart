// Custom ThemeExtension for semantic colors

import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Custom ThemeExtension for colors that Material 3 doesn't expose
/// (success, warning, danger, custom text tokens, background).
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color success;
  final Color warning;
  final Color danger;
  final Color background;
  final Color textPrimary;
  final Color textSecondary;

  const AppColorsExtension({
    required this.success,
    required this.warning,
    required this.danger,
    required this.background,
    required this.textPrimary,
    required this.textSecondary,
  });

  static const light = AppColorsExtension(
    success: AppColors.success,
    warning: AppColors.warning,
    danger: AppColors.danger,
    background: AppColors.lightBackground,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
  );

  static const dark = AppColorsExtension(
    success: AppColors.success,
    warning: AppColors.warning,
    danger: AppColors.danger,
    background: AppColors.darkBackground,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
  );

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? warning,
    Color? danger,
    Color? background,
    Color? textPrimary,
    Color? textSecondary,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      background: background ?? this.background,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      background: Color.lerp(background, other.background, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}

/// Shortcut: `context.appColors.success` everywhere.
extension AppThemeContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension.light;
}
