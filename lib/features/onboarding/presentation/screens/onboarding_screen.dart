import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reptrack/core/router/app_routes.dart';
import 'package:reptrack/core/theme/app_colors.dart';
import 'package:reptrack/core/theme/app_spacing.dart';

import '../widgets/onboarding_page.dart';
import '../widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data for the 3 pages
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Welcome to\nRepTrack',
      'description': 'Log every rep, track every\nset, see every gain.',
      'icon': Icons.fitness_center_rounded,
    },
    {
      'title': 'Personalized\nSplits',
      'description': 'PPL, Upper/Lower,\nor custom programs.',
      'icon': Icons.bar_chart_rounded,
    },
    {
      'title': 'See Your\nProgress',
      'description': 'Track your journey with\nbeautiful insights.',
      'icon': Icons.emoji_events_rounded,
    },
  ];

  void _onNext() {
    if (_currentPage == _pages.length - 1) {
      // On last page -> Go to Home (or Onboarding Form if you had one)
      // Since we skipped the form for this UI, we go straight to home.
      context.go(AppRoutes.home);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    // Jump to the last page
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      body: SafeArea(
        child: Column(
          children: [
            // ---------- Top Bar (Skip Button) ----------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: isLastPage ? null : _onSkip,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.lightPrimary,
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
            ),

            // ---------- Page View ----------
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: _pages[index]['title'],
                    description: _pages[index]['description'],
                    illustration: _buildIllustration(
                      _pages[index]['icon'],
                      index,
                    ),
                  );
                },
              ),
            ),

            // ---------- Bottom Section ----------
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                children: [
                  PageIndicator(
                    currentPage: _currentPage,
                    pageCount: _pages.length,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: _onNext,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.lightPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                      ),
                      child: Text(
                        isLastPage ? 'Get Started' : 'Continue',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build the stylized icons matching the provided design
  Widget _buildIllustration(IconData icon, int index) {
    // Different colors for different pages to match the vibe
    final colors = [
      [AppColors.lightPrimary, AppColors.lightPrimaryContainer],
      [AppColors.lightPrimary, const Color(0xFFE0F2FE)],
      [const Color(0xFFF59E0B), const Color(0xFFFEF3C7)],
    ];

    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors[index][1].withValues(alpha: 0.5),
      ),
      child: Icon(icon, size: 70, color: colors[index][0]),
    );
  }
}
