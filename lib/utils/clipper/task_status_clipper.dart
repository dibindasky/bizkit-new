import 'package:flutter/material.dart';

class TaskStatusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(width * 0.76, 0);

    path.cubicTo(
      width * 0.90,
      3,
      width * 0.85,
      height * 0.3,
      width * 0.95,
      height * 0.2,
    );

    path.lineTo(width, height * 0.2);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
