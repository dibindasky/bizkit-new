import 'package:flutter/material.dart';

class TaskStatusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(width - 70, 0);

    path.quadraticBezierTo(width - 50, 0, width - 50, 15);
    path.quadraticBezierTo(width - 50, 40, width - 15, 48);
    path.quadraticBezierTo(width, 50, width, 70);

    path.lineTo(width, height);
    path.lineTo(0, height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Shadow Painter to match the Clipper Shape
class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Path shadowPath = Path();

    // Start from bottom left with a similar curve
    shadowPath.moveTo(20, height);
    shadowPath.quadraticBezierTo(0, height - 20, 0, height - 40);

    // Left side curve
    shadowPath.lineTo(0, 40);
    shadowPath.quadraticBezierTo(0, 20, 20, 0);

    // Top side curve
    shadowPath.lineTo(width - 60, 0);
    shadowPath.quadraticBezierTo(width - 50, 0, width - 50, 15);
    shadowPath.quadraticBezierTo(width - 50, 40, width - 15, 48);
    shadowPath.quadraticBezierTo(width, 50, width, 70);

    // Right bottom curve
    shadowPath.lineTo(width, height - 30);
    shadowPath.quadraticBezierTo(width, height - 10, width - 30, height);

    shadowPath.close();

    // Create shadow
    canvas.drawShadow(
        shadowPath,
        Colors.grey.withOpacity(0.5), // Shadow color
        7.0, // Elevation
        true // Transparent occluder
        );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
