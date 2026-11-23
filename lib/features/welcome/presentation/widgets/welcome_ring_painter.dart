import 'package:flutter/widgets.dart';

class WelcomeRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;

  const WelcomeRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Drawing the ring
    final bgPaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Draw active progress ring
    final progressPaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth + 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start at top center (-pi/2) and sweep based on progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2, // Start at top (-90 degrees in radians)
      3.14159 * 2 * progress, // Sweep angle
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant WelcomeRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}
