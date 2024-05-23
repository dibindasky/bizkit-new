import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EventButton extends StatelessWidget {
  const EventButton({
    super.key,
    required this.text,
    required this.onTap,
    this.wdth,
    this.hieght,
    this.textColr,
    this.color,
    this.borderRadius,
  });

  final String text;
  final VoidCallback onTap;
  final double? wdth;
  final double? hieght;
  final Color? textColr;
  final Gradient? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: wdth ?? 150,
        height: hieght ?? 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 9),
          ),
          gradient: color ?? neonShadeGradient,
        ),
        child: Center(
          child: Text(
            text,
            style: custumText(
              colr: textColr,
              fontSize: kwidth * 0.033,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
