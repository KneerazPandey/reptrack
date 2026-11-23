import 'package:material_ui/material_ui.dart';

//Color palette (light + dark)

/// Raw color tokens for RepTrack.
/// Usage: import this for one-off colors, but prefer Theme.of(context)
/// and AppColorsExtension for semantic access.
class AppColors {
  AppColors._();

  // ============================================================
  // LIGHT
  // ============================================================
  static const Color lightPrimary = Color(0xFF6366F1);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFE0E7FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9);
  static const Color lightBackground = Color(0xFFFAFAFB);
  static const Color lightOutline = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);

  // ============================================================
  // DARK
  // ============================================================
  static const Color darkPrimary = Color(0xFF818CF8);
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkPrimaryContainer = Color(0xFF312E81);
  static const Color darkSurfaceVariant = Color(0xFF2A2A3A);
  static const Color darkBackground = Color(0xFF121218);
  static const Color darkOutline = Color(0xFF3A3A4A);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // ============================================================
  // SHARED SEMANTIC (same in both modes unless overridden)
  // ============================================================
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);

  // ============================================================
  // For splash screen
  // ============================================================
  static const Color splashBackgroundTop = Color(0xFF4C4EEA);
  static const Color splashBackgroundBottom = Color(0xFF1A1B4B);
  static const Color splashLogoOuter = Color(0xFF7A7BFF);
  static const Color splashLogoInner = Color(0xFF5B5CFF);

  // New Dark Theme Colors
  static const Color darkBg = Color(0xFF0F0F0F); // Very dark grey/black
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color neonPrimary = Color(0xFFA8FF35); // Lime green
  static const Color neonBlue = Color(0xFF3B82F6); // For the "+3 partial" badge
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFF9CA3AF);
}
