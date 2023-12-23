import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double progress;
  final double radius;
  final double strokeWidth;
  final double startPoint;
  final Color loadingColor;

  MyPainter(this.progress, this.radius, this.loadingColor, this.strokeWidth,
      [this.startPoint = 0]);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = loadingColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius)));

    final metric = path.computeMetrics().first;

    final double startPosition = metric.length * startPoint;
    final double endPosition =
        metric.length * progress.clamp(0.0, 1.0) + startPosition;

    if (endPosition > metric.length) {
      final extractPath1 = metric.extractPath(startPosition, metric.length);
      final extractPath2 = metric.extractPath(0, endPosition - metric.length);
      canvas.drawPath(extractPath1, paint);
      canvas.drawPath(extractPath2, paint);
    } else {
      final extractPath = metric.extractPath(startPosition, endPosition);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
