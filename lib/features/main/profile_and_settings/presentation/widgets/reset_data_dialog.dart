import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';

class ResetDataDialog extends StatefulWidget {
  const ResetDataDialog({super.key});

  @override
  State<ResetDataDialog> createState() => _ResetDataDialogState();
}

class _ResetDataDialogState extends State<ResetDataDialog> {
  final TextEditingController _confirmController = TextEditingController();
  bool _isConfirmed = false;

  // The exact word the user must type
  static const String _confirmWord = 'RESET';

  @override
  void initState() {
    super.initState();
    _confirmController.addListener(() {
      final isMatch =
          _confirmController.text.trim().toUpperCase() == _confirmWord;
      if (isMatch != _isConfirmed) {
        setState(() => _isConfirmed = isMatch);
      }
    });
  }

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Dialog build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1A1A1A), // Dark grey background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Warning Icon ----------
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.danger.withValues(
                  alpha: 0.15,
                ), // Faint red background
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_outline_rounded,
                color: AppColors.danger,
                size: 24,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ---------- Title ----------
            const Text(
              'Reset all data?',
              style: TextStyle(
                color: AppColors.textWhite,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            // ---------- Description ----------
            const Text(
              'This permanently deletes all splits, sessions, sets and bodyweight entries on this device. Export a backup first if you might need it.',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // ---------- Input Label ----------
            const Text(
              'TYPE RESET TO CONFIRM',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            // ---------- Input Field ----------
            TextField(
              controller: _confirmController,
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: AppColors.danger,
              decoration: InputDecoration(
                hintText: _confirmWord, // Using the exact word as a placeholder
                hintStyle: TextStyle(
                  color: AppColors.danger.withValues(alpha: 0.3),
                ),
                filled: true,
                fillColor: const Color(
                  0xFF222222,
                ), // Slightly lighter than background
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 16,
                ),
                // Red border styling
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: _isConfirmed
                        ? AppColors.danger
                        : const Color(0xFF444444),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.danger,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ---------- Delete Button ----------
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                // Only active if the correct word is typed
                onPressed: _isConfirmed
                    ? () {
                        // TODO: Execute delete logic here
                        // Hive.box('user_profile').clear();
                        // Hive.box('splits').clear();
                        // Hive.box('sessions').clear();

                        Navigator.pop(context); // Close dialog
                      }
                    : null,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.danger,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF333333),
                  disabledForegroundColor: AppColors.textGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Delete everything',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            // ---------- Cancel Button ----------
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textWhite,
                  side: const BorderSide(color: Color(0xFF444444), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
