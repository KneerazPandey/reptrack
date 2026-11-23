import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/theme/theme_extensions.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';

class UnitsAndBodyweightScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<UnitsAndBodyweightScreen> createState() =>
      _UnitsAndBodyweightScreenState();
}

class _UnitsAndBodyweightScreenState extends State<UnitsAndBodyweightScreen> {
  // State for Unit Selection (0 = kg, 1 = lbs)
  int _selectedUnitIndex = 0;
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _weightController.text = '78.5';
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKg = _selectedUnitIndex == 0;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
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
                              onTap: () =>
                                  Navigator.pop(context), // Or context.pop()
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
                                final isActive = index == 1; // 2nd dot
                                final isPast = index == 0;
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

                        Text(
                          'STEP 2 OF 4',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Units and bodyweight',
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
                          'Used for weights, charts and exports. You can change units later in settings.',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl * 1.5),

                        // ---------- Weight Unit Toggle ----------
                        Text(
                          'WEIGHT UNIT',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        Container(
                          height: 52,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: context.colors.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              _buildUnitTab('Kilograms (kg)', 0, isKg),
                              _buildUnitTab('Pounds (lbs)', 1, !isKg),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),

                        // ---------- Bodyweight Input ----------
                        Text(
                          'BODYWEIGHT',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        TextField(
                          controller: _weightController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: TextStyle(
                            // 👈 Main input text (White in Dark / Black in Light)
                            color: context.colors.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          cursorColor: context.colors.primary,
                          decoration: InputDecoration(
                            filled: true,
                            // 👈 Input field background (Dark grey in Dark / Light grey in Light)
                            fillColor: context.colors.surfaceContainerHighest,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: 16,
                            ),
                            // Suffix text (kg / lbs)
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: AppSpacing.md,
                              ),
                              child: Center(
                                widthFactor: 1.0,
                                child: Text(
                                  isKg ? 'kg' : 'lbs',
                                  style: TextStyle(
                                    // 👈 Secondary text (Grey in both modes)
                                    color: context.colors.onSurfaceVariant,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            // Default Border (Transparent to match your design)
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            // Focused Border (Neon Green / Forest Green when typing)
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: context.colors.primary,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Optional. Starts your bodyweight chart.',
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl * 1.2),

                        // ---------- Privacy Banner ----------
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: context.colors.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: context.colors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.shield_outlined,

                                  color: context.colors.primary,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),

                              Expanded(
                                child: Text(
                                  'Private by design. Nothing leaves your phone.',
                                  style: TextStyle(
                                    color: context.colors.onSurface,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom spacing for scroll area
                        Spacer(),

                        RepTrackElevatedButton(
                          onPressed: () {
                            context.push(AppRoutes.timerAndGoals);
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

  // Custom Tab Button for the segmented control
  Widget _buildUnitTab(String text, int index, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedUnitIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isActive ? context.colors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.black : AppColors.darkTextSecondary,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
