import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/theme/theme_extensions.dart';
import 'package:reptrack/features/main/profile_and_settings/presentation/widgets/reset_data_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _dailyReminderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),

              // ---------- Header ----------
              Text(
                'Profile',
                style: TextStyle(
                  color: context.colors.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ---------- User Info Card ----------
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Avatar
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context
                            .colors
                            .surfaceContainerHighest, // Dark grey circle
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'N',
                        style: TextStyle(
                          color: context.colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),

                    // Name & Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Niraj',
                            style: TextStyle(
                              color: context.colors.onSurface,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '78.5 kg · goal 5 days a week',
                            style: TextStyle(
                              color: context.colors.onSurfaceVariant,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Edit Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: context.colors.onSurface,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // ---------- Group 1: Settings List ----------
              Container(
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildSettingsRow(
                      title: 'Units',
                      onTap: () {},
                      trailingText: 'kg',
                    ),
                    _buildDivider(),

                    _buildSettingsRow(
                      title: 'Workout options',
                      onTap: () {},
                      trailingText: 'Rest 90s',
                    ),
                    _buildDivider(),

                    _buildSettingsRow(
                      title: 'Appearance',
                      onTap: () {
                        context.push(AppRoutes.appearance);
                      },
                      trailingText: 'Dark',
                    ),
                    _buildDivider(),
                    // Custom row for the Toggle Switch
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Daily reminder',
                              style: TextStyle(
                                color: context.colors.onSurface,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '18:00',
                            style: TextStyle(
                              color: context.colors.onSurfaceVariant,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          // Custom neon toggle switch
                          _buildCustomSwitch(
                            value: _dailyReminderEnabled,
                            onChanged: (val) {
                              setState(() => _dailyReminderEnabled = val);
                            },
                            primaryColor: context.colors.primary,
                            trackColor: context.colors.surfaceContainerHighest,
                          ),
                        ],
                      ),
                    ),
                    _buildDivider(),

                    _buildSettingsRow(title: 'Bodyweight log', onTap: () {}),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // ---------- Group 2: Data Actions ----------
              Container(
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildSettingsRow(
                      title: 'Export and import data',
                      onTap: () {
                        context.push(AppRoutes.exportImport);
                      },
                    ),
                    _buildDivider(),
                    // Danger row
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => ResetDataDialog(),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Reset all data',
                                style: TextStyle(
                                  color: context.colors.error,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // ---------- Footer ----------
              Center(
                child: Text(
                  'RepTrack · offline · no ads · no tracking',
                  style: TextStyle(
                    color: context.colors.onSurfaceVariant,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 100), // Padding for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widget for standard rows ---
  Widget _buildSettingsRow({
    required String title,
    required VoidCallback onTap,
    String? trailingText,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: context.colors.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText,
                style: const TextStyle(
                  color: AppColors.darkTextSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
            ],
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.darkTextSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widget for dividers ---
  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.colors.outline,
      indent: AppSpacing.md,
      endIndent: AppSpacing.md,
    );
  }

  // --- Helper Widget for custom neon switch ---
  Widget _buildCustomSwitch({
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color primaryColor,
    required Color trackColor,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 46,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: value ? primaryColor : trackColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: context.colors.onPrimary, // Dark thumb
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
