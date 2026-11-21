import 'package:material_ui/material_ui.dart';

// Spacing + radius + elevation + motion

/// Spacing scale (multiples of 4).
class AppSpacing {
  AppSpacing._();
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
}

/// Border radii.
class AppRadius {
  AppRadius._();
  static const double chip = 12;
  static const double card = 16;
  static const double sheet = 24;
  static const double pill = 999;

  // Convenience BorderRadius helpers
  static const BorderRadius rChip = BorderRadius.all(Radius.circular(chip));
  static const BorderRadius rCard = BorderRadius.all(Radius.circular(card));
  static const BorderRadius rSheet = BorderRadius.vertical(
    top: Radius.circular(sheet),
  );
  static const BorderRadius rPill = BorderRadius.all(Radius.circular(pill));
}

/// Elevation values.
class AppElevation {
  AppElevation._();
  static const double flat = 0;
  static const double card = 1;
  static const double sheet = 3;
}

/// Motion durations & curves.
class AppMotion {
  AppMotion._();
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration sheet = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 400);

  static const Curve defaultCurve = Curves.easeOut;
  static const Curve sheetCurve = Curves.easeOutCubic;
}
