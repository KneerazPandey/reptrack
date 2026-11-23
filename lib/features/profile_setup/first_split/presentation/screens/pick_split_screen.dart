import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';

class PickSplitScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PickSplitScreen> createState() => _PickSplitScreenState();
}

class _PickSplitScreenState extends State<PickSplitScreen> {
  // Track the selected split. Default is the first one (index 0).
  int _selectedSplitIndex = 0;

  // Data for the split templates
  final List<Map<String, String>> _splitTemplates = [
    {'title': 'Push / Pull / Legs', 'subtitle': '3 days · Push, Pull, Legs'},
    {'title': 'Upper / Lower', 'subtitle': '4 days'},
    {'title': 'Full Body', 'subtitle': '3 days'},
    {'title': 'Bro Split', 'subtitle': '5 days · one muscle group a day'},
    {'title': 'Arnold Split', 'subtitle': '6 days'},
    {'title': 'PHUL', 'subtitle': '4 days · power and hypertrophy'},
    {'title': '5x5', 'subtitle': '3 days · strength'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1A1A1A),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColors.textWhite,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.lg),

                            // Step Indicator (2 of 4)
                            Row(
                              children: List.generate(4, (index) {
                                final isActive = index == 3; // 3nd dot
                                final isPast = index == 2;
                                return Container(
                                  width: isActive ? 24 : 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? AppColors.neonPrimary
                                        : isPast
                                        ? AppColors.neonPrimary.withValues(
                                            alpha: 0.5,
                                          )
                                        : const Color(0xFF2A2A2A),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.xl * 1.5),

                        // ---------- Text Content ----------
                        const Text(
                          'STEP 4 OF 4',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          'Pick a split',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        const Text(
                          'Start from a template. Edit it anytime.',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        // ---------- Split Templates List ----------
                        ...List.generate(_splitTemplates.length, (index) {
                          final isSelected = _selectedSplitIndex == index;
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSpacing.sm,
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedSplitIndex = index),
                              child: _buildSplitCard(
                                title: _splitTemplates[index]['title']!,
                                subtitle: _splitTemplates[index]['subtitle']!,
                                isSelected: isSelected,
                              ),
                            ),
                          );
                        }),

                        // ---------- Build My Own Button ----------
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSpacing.xl,
                            top: AppSpacing.xs,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.md,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Build my own',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add_rounded,
                                    color: AppColors.textWhite,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),
                        RepTrackElevatedButton(
                          onPressed: () {
                            context.go(AppRoutes.home);
                          },
                          name: 'Start training',
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // --- Helper Widget for Split Cards ---
  Widget _buildSplitCard({
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        // Outline neon green when selected
        border: Border.all(
          color: isSelected ? AppColors.neonPrimary : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Custom Radio Button
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.neonPrimary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : const Color(0xFF444444), // Visible outline for unselected
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.black)
                : null,
          ),
        ],
      ),
    );
  }
}
