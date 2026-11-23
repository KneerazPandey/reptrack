import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimaryLight,
        secondary: AppColors.primaryLight,
        onSecondary: AppColors.onPrimaryLight,

        // 👇 The main card background
        surface: AppColors.lightSurface,

        // 👇 The text color
        onSurface: AppColors.lightTextPrimary,

        // 👇 The lighter text color
        onSurfaceVariant: AppColors.lightTextSecondary,

        // 👇 THE MAGIC COLOR (Inner circle, input fields, etc)
        surfaceContainerHighest: AppColors.lightSurfaceVariant,

        // 👇 Borders and dividers
        outline: AppColors.lightBorder,

        error: AppColors.danger,
        onError: Colors.white,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        secondary: AppColors.primaryDark,
        onSecondary: AppColors.onPrimaryDark,

        // 👇 The main card background
        surface: AppColors.darkSurface,

        // 👇 The text color
        onSurface: AppColors.darkTextPrimary,

        // 👇 The lighter text color
        onSurfaceVariant: AppColors.darkTextSecondary,

        // 👇 THE MAGIC COLOR (Inner circle, input fields, etc)
        surfaceContainerHighest: AppColors.darkSurfaceVariant,

        // 👇 Borders and dividers
        outline: AppColors.darkBorder,

        error: AppColors.danger,
        onError: Colors.white, // Used for input fields/cards
      ),
      // ... other dark theme config (AppBar, Buttons, etc.)
    );
  }
}
