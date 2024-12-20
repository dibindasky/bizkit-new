import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.onTap,
    this.child,
    required this.backgroundColor,
    required this.backgroundColorInner,
    this.radius,
  });

  final VoidCallback onTap;
  final Widget? child;
  final Color backgroundColor;
  final Color backgroundColorInner;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius ?? 24,
        child: CircleAvatar(
          radius: radius != null ? radius! - 8 : 16,
          backgroundColor: backgroundColorInner,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: radius != null ? radius! - 8 : 14,
            child: child ??
                const Icon(
                  size: 19,
                  Icons.notifications,
                  color: kneon,
                ),
          ),
        ),
      ),
    );
  }
}

class CustomStackOnlineDotCircleAvatar extends StatelessWidget {
  const CustomStackOnlineDotCircleAvatar({
    super.key,
    required this.image,
    this.dotColor,
    this.backgroundColor,
    this.isChild = true,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String image;
  final Color? dotColor;
  final Color? backgroundColor;
  final bool isChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            backgroundImage: isChild ? null : AssetImage(image),
            child: isChild
                ? Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(image),
                  )
                : null,
          ),
          if (dotColor != null)
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: dotColor,
              ),
            ),
        ],
      ),
    );
  }
}
