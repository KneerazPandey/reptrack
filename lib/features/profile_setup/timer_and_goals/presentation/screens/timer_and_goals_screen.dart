import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/theme/theme_extensions.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';

class TimerAndGoalsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TimerAndGoalsScreen> createState() => TimerAndGoalsScreenState();
}

class TimerAndGoalsScreenState extends State<TimerAndGoalsScreen> {
  // Default Rest Timer State
  int _selectedRestIndex = 1; // Default to 90s
  final List<int> _restOptions = [60, 90, 120, 180];

  // Weekly Goal State
  int _selectedDays = 5; // Default to 5 days

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
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
                                decoration: BoxDecoration(
                                  color: context.colors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: context.colors.onPrimary,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.lg),

                            // Step Indicator (2 of 4)
                            Row(
                              children: List.generate(4, (index) {
                                final isActive = index == 2; // 2nd dot
                                final isPast = index == 1;
                                return Container(
                                  width: isActive ? 24 : 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? context.colors.primary
                                        : isPast
                                        ? context.colors.primary.withValues(
                                            alpha: 0.5,
                                          )
                                        : context.colors.onSurfaceVariant,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.xl * 1.5),

                        // ---------- Text Content ----------
                        Text(
                          'STEP 3 OF 4',
                          style: TextStyle(
                            color: context.colors.onSurface,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Your training rhythm',
                          style: TextStyle(
                            color: context.colors.onSurface,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Sets the default rest between sets and your weekly target.',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl * 1.5),

                        // ---------- Card 1: Default Rest Timer ----------
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: context.colors.surface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        color: context.colors.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(width: AppSpacing.xs),
                                      Text(
                                        'Default rest timer',
                                        style: TextStyle(
                                          color: context.colors.onSurface,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _selectedRestIndex == -1
                                        ? 'Custom'
                                        : '${_restOptions[_selectedRestIndex]}s',
                                    style: TextStyle(
                                      color: context.colors.onSurface,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: AppSpacing.md),

                              Wrap(
                                spacing: AppSpacing.sm,
                                runSpacing: AppSpacing.sm,
                                children: [
                                  _buildRestChip('60s', 0),
                                  _buildRestChip('90s', 1),
                                  _buildRestChip('2 min', 2),
                                  _buildRestChip('3 min', 3),
                                  _buildCustomChip('Custom'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // ---------- Card 2: Weekly Goal ----------
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: context.colors.surface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: context.colors.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(width: AppSpacing.xs),
                                      Text(
                                        'Weekly goal',
                                        style: TextStyle(
                                          color: context.colors.onSurface,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '$_selectedDays ${_selectedDays == 1 ? 'day' : 'days'}',
                                    style: TextStyle(
                                      color: context.colors.onSurface,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.md),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(7, (index) {
                                  final day = index + 1;
                                  final isSelected = _selectedDays == day;
                                  return GestureDetector(
                                    onTap: () =>
                                        setState(() => _selectedDays = day),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      width: 38, // Fixed width to ensure circles stay round
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? context.colors.primary
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? Colors.transparent
                                              : context.colors.onSurfaceVariant,
                                          width: 1.5,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        day.toString(),
                                        style: TextStyle(
                                          color: isSelected
                                              ? context.colors.onPrimary
                                              : context.colors.onSurface,
                                          fontSize: 14,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        RepTrackElevatedButton(
                          onPressed: () {
                            context.push(AppRoutes.pickSplit);
                          },
                          name: 'Continue',
                        ),
                        const SizedBox(height: 20),
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

  Widget _buildRestChip(String label, int index) {
    final isSelected = _selectedRestIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedRestIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : context.colors.onSurfaceVariant,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? context.colors.onPrimary
                : context.colors.onSurface,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomChip(String label) {
    final isSelected = _selectedRestIndex == -1;
    return GestureDetector(
      onTap: () => setState(() => _selectedRestIndex = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : context.colors.onSurfaceVariant,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? context.colors.onPrimary
                : context.colors.onSurface,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
