import 'dart:math';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularSlider extends StatefulWidget {
  final double initialValue; // Initial percentage (0-100)
  final ValueChanged<double> onChanged; // Callback to return the percentage

  const CircularSlider({
    Key? key,
    this.initialValue = 0,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  late double percentage;
  late Offset center;
  late double radius;

  @override
  void initState() {
    super.initState();
    percentage = widget.initialValue;

  }

 void _updatePercentage(Offset touchPosition) {
  // Calculate the angle from the center
  final dx = touchPosition.dx - center.dx;
  final dy = touchPosition.dy - center.dy;
  double angle = atan2(dy, dx) + pi / 2;

  // Adjust angle if it crosses the top point
  if (angle < 0) angle += 2 * pi;

  // Convert angle to percentage
  double newPercentage = (angle / (2 * pi)) * 100;

  // Explicitly handle full-circle case
  if ((2 * pi - angle).abs() < 0.1) {
    newPercentage = 100;
  }

  setState(() {
    percentage = newPercentage.clamp(0, 100);
  });

  widget.onChanged(percentage);
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        center = box.size.center(Offset.zero);
        radius = min(center.dx, center.dy);
        _updatePercentage(details.localPosition);
      },
      onPanUpdate: (details) {
        _updatePercentage(details.localPosition);
      },
      child: CustomPaint(
        size: const Size(100, 100), // Fixed size
        painter: _CircularSliderPainter(percentage),
      ),
    );
  }
}

class _CircularSliderPainter extends CustomPainter {
  final double percentage;

  _CircularSliderPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    final progressPaint = Paint()
      ..color = neonShade 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start angle (12 o'clock)
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw percentage text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toInt()}%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
        canvas, center - Offset(textPainter.width / 2, textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}