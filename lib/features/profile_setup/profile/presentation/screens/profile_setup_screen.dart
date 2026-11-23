import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';
import 'package:reptrack/core/widgets/reptrack_elevated_button.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // ---------- Top Bar (Progress & Skip) ----------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.xl,
                            AppSpacing.md,
                            AppSpacing.xl,
                            AppSpacing.sm,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Step Indicator (1 of 4)
                              Row(
                                children: List.generate(4, (index) {
                                  final isActive = index == 0;
                                  return Container(
                                    width: isActive ? 24 : 8,
                                    height: 8,
                                    margin: const EdgeInsets.only(right: 6),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? AppColors.neonPrimary
                                          : const Color(0xFF2A2A2A),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                }),
                              ),
                              // Skip Button
                              TextButton(
                                onPressed: () {
                                  // context.go(AppRoutes.home);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: AppColors.textGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.textGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ---------- Scrollable Content ----------
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: AppSpacing.xl),

                              // Step Title
                              const Text(
                                'STEP 1 OF 4',
                                style: TextStyle(
                                  color: AppColors.textGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              const Text(
                                'What should we call you?',
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
                                'Your name and photo are stored only on this device.',
                                style: TextStyle(
                                  color: AppColors.textGrey,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: AppSpacing.xl * 1.5),

                              // Profile Photo Picker
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // TODO: Integrate image_picker package
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1A1A1A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.person_outline_rounded,
                                        color: AppColors.textWhite,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Profile photo',
                                          style: TextStyle(
                                            color: AppColors.textWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          'Optional. Tap to choose from gallery.',
                                          style: TextStyle(
                                            color: AppColors.textGrey,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: AppSpacing.xl),

                              // Name Input Field
                              const Text(
                                'NAME',
                                style: TextStyle(
                                  color: AppColors.textGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                cursorColor: AppColors.neonPrimary,
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                  hintStyle: TextStyle(
                                    color: AppColors.textGrey.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFF1A1A1A),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.md,
                                    vertical: 18,
                                  ),
                                  // The neon green border when focused
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: AppColors.neonPrimary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                          ),
                          child: RepTrackElevatedButton(
                            onPressed: () {
                              context.push(AppRoutes.unitsAndBodyweight);
                            },
                            name: 'Continue',
                          ),
                        ),

                        SizedBox(height: 30),
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
}
