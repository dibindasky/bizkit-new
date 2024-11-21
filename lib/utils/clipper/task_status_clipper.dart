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
