import 'package:flutter/material.dart';

class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 30) // Start from top-left with curve
      ..quadraticBezierTo(0, 0, 30, 0) // Top-left curve
      ..lineTo(size.width - 30, 0) // Top line
      ..quadraticBezierTo(size.width, 0, size.width, 30) // Top-right curve
      ..lineTo(size.width, size.height) // Right line
      ..lineTo(0, size.height) // Bottom line
      ..close(); // Back to start

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
