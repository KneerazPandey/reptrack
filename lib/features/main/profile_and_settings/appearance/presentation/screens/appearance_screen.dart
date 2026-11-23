import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/provider/theme_notifier.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(themeProvider);
    final theme = Theme.of(context); // 👈 Get the active theme

    // 👇 Dynamically pull colors from the theme
    final bgColor = theme.scaffoldBackgroundColor;
    final surfaceColor = theme.colorScheme.surface;
    final cardColor = theme.colorScheme.surfaceContainerHighest;
    final textPrimary = theme.colorScheme.onSurface;
    final textSecondary = theme.textTheme.bodySmall?.color ?? Colors.grey;
    final accentColor = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: bgColor, // 👈 Adapts to light/dark
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Top Bar ----------
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: cardColor, // 👈 Adapts
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: textPrimary, // 👈 Adapts
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Appearance',
                    style: TextStyle(
                      color: textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // ---------- Theme Selection ----------
              Text(
                'THEME',
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12),

              Container(
                height: 48,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: cardColor, // 👈 Adapts
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _buildThemeTab(
                      'System',
                      ThemeMode.system,
                      currentMode,
                      ref,
                      textPrimary,
                      accentColor,
                    ),
                    _buildThemeTab(
                      'Light',
                      ThemeMode.light,
                      currentMode,
                      ref,
                      textPrimary,
                      accentColor,
                    ),
                    _buildThemeTab(
                      'Dark',
                      ThemeMode.dark,
                      currentMode,
                      ref,
                      textPrimary,
                      accentColor,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ---------- Preview Card ----------
              Text(
                'PREVIEW',
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12),

              // The Live Preview Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Barbell Bench Press',
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'PR',
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Chest',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Set Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSetStat('1', textPrimary),
                        _buildSetStat('60', textPrimary),
                        _buildSetStat('8', textPrimary),
                        _buildSetStat('0', textSecondary),
                        Text(
                          'Normal',
                          style: TextStyle(color: textSecondary, fontSize: 12),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: textPrimary,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    RepTrackElevatedButton(onPressed: () {}, name: 'Log Set'),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeTab(
    String text,
    ThemeMode mode,
    ThemeMode currentMode,
    WidgetRef ref,
    Color textColor,
    Color accentColor,
  ) {
    final isSelected = mode == currentMode;

    return Expanded(
      child: GestureDetector(
        onTap: () => ref.read(themeProvider.notifier).setTheme(mode),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? accentColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : textColor,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSetStat(String value, Color color) {
    return Text(
      value,
      style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w700),
    );
  }
}
