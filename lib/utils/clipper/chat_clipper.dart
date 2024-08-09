import 'package:flutter/material.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  final bool isSender;
  final bool showArrow;

  ChatBubbleClipper({required this.isSender, this.showArrow = true});

  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;

    Path path = Path();

    if (isSender) {
      path.moveTo(6, 0);
      path.lineTo(x - 16, 0);
      path.quadraticBezierTo(x - 10, 0, x - 10, 6);
      path.lineTo(x - 10, y - 20);
      if (showArrow) {
        path.quadraticBezierTo(x - 6, y - 12, x, y - 12);
        path.quadraticBezierTo(x - 5, y - 5, x - 10, y - 6);
        path.quadraticBezierTo(x - 10, y, x - 16, y);
      }
      path.lineTo(6, y);
      path.quadraticBezierTo(0, y, 0, y - 6);
      path.lineTo(0, 6);
      path.quadraticBezierTo(0, 0, 6, 0);
    } else {
      path.moveTo(x - 6, 0);
      path.lineTo(16, 0);
      path.quadraticBezierTo(10, 0, 10, 6);
      path.lineTo(10, y - 20);
      if (showArrow) {
        path.quadraticBezierTo(6, y - 12, 0, y - 12);
        path.quadraticBezierTo(5, y - 5, 10, y - 6);
        path.quadraticBezierTo(10, y, 16, y);
      }
      path.lineTo(x - 6, y);
      path.quadraticBezierTo(x, y, x, y - 6);
      path.lineTo(x, 6);
      path.quadraticBezierTo(x, 0, x - 6, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
