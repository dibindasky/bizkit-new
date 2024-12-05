import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EventButton extends StatelessWidget {
  const EventButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.hieght,
    this.textColr,
    this.textStyle,
    this.color,
    this.borderRadius,
    this.showGradiant = true,
    this.padding,
    this.margin,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? hieght;
  final Color? textColr;
  final Gradient? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool showGradiant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width ?? 150,
        height: hieght ?? 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 25),
          ),
          color: Theme.of(context).colorScheme.surface,
          gradient: showGradiant ? (color ?? neonShadeGradient) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: textColr ?? kblack),
          ),
        ),
      ),
    );
  }
}
