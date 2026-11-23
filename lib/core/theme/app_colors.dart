import 'package:material_ui/material_ui.dart';

class AppColors {
  AppColors._();

  // ============================================================
  // PRIMARY BRAND COLORS (The dynamic accent)
  // ============================================================
  // Used in Light Theme (Darker green for contrast on white)
  static const Color primaryLight = Color(0xFF4D7C0F);
  static const Color onPrimaryLight = Colors.white;

  // Used in Dark Theme (Neon lime for contrast on black)
  static const Color primaryDark = Color(0xFFA8FF35);
  static const Color onPrimaryDark = Colors.black;

  // ============================================================
  // LIGHT THEME (Backgrounds, Surfaces, Text)
  // ============================================================
  static const Color lightBackground = Color(
    0xFFF9FAFB,
  ); // Very light grey/white
  static const Color lightSurface = Colors.white; // Pure white for cards
  static const Color lightSurfaceVariant = Color(
    0xFFF3F4F6,
  ); // For input fields
  static const Color lightBorder = Color(0xFFE5E7EB); // Subtle borders

  static const Color lightTextPrimary = Color(0xFF111827); // Almost black
  static const Color lightTextSecondary = Color(0xFF6B7280); // Dark grey

  // ============================================================
  // DARK THEME (Backgrounds, Surfaces, Text)
  // ============================================================
  static const Color darkBackground = Color(0xFF0F0F0F); // Deep black
  static const Color darkSurface = Color(0xFF1A1A1A); // Dark grey for cards
  static const Color darkSurfaceVariant = Color(0xFF2A2A2A); // For input fields
  static const Color darkBorder = Color(0xFF333333); // Subtle borders

  static const Color darkTextPrimary = Color(0xFFFFFFFF); // Pure white
  static const Color darkTextSecondary = Color(0xFF9CA3AF); // Light grey

  // ============================================================
  // SHARED SEMANTIC (Same in both modes)
  // ============================================================
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444); // Red for destructive actions
  static const Color info = Color(0xFF3B82F6); // Blue for partial reps/links

  // ============================================================
  // SPLASH SCREEN (Custom Gradient)
  // ============================================================
  static const Color splashBackgroundTop = Color(0xFF1A2A15);
  static const Color splashBackgroundBottom = Color(0xFF0F0F0F);
  static const Color splashLogoOuter = Color(0xFFA8FF35);
  static const Color splashLogoInner = Color(0xFF7ACC1A);
}
