import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/theme/theme_extensions.dart';

class RepTrackElevatedButton extends StatelessWidget {
  final double height;
  final VoidCallback onPressed;
  final String name;

  const new({
    super.key,
    this.height = 56,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 56,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.primary,
          foregroundColor: context.colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
