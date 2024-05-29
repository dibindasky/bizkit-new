import 'package:flutter/material.dart';

class PollChatClipper extends CustomClipper<Path> {
  PollChatClipper({required this.isSender});

  final bool isSender;

  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;

    Path path = Path();
    if (isSender) {
      path.moveTo(6, 0);
      path.lineTo(x, 0);
      path.lineTo(x - 10, 7);
      path.lineTo(x - 10, y - 6);
      path.quadraticBezierTo(x - 10, y, x - 16, y);
      path.lineTo(6, y);
      path.quadraticBezierTo(0, y, 0, y - 6);
      path.lineTo(0, 6);
      path.quadraticBezierTo(0, 0, 6, 0);
    } else {
      path.moveTo(0, 0);
      path.lineTo(x - 6, 0);
      path.quadraticBezierTo(x, 0, x, 6);
      path.lineTo(x, y - 6);
      path.quadraticBezierTo(x, y, x - 6, y);
      path.lineTo(16, y);
      path.quadraticBezierTo(10, y, 10, y - 6);
      path.lineTo(10, 7);
      path.lineTo(0, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
