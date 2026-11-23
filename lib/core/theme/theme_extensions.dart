import 'package:material_ui/material_ui.dart';

extension ThemeExtensions on BuildContext {
  // Quick access to ThemeData
  ThemeData get theme => Theme.of(this);

  // Quick access to ColorScheme
  ColorScheme get colors => Theme.of(this).colorScheme;

  // Quick access to TextTheme
  TextTheme get textStyles => Theme.of(this).textTheme;
}
