import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: currentPage == index ? 18 : 6,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.lightPrimary
                : AppColors.lightPrimary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
