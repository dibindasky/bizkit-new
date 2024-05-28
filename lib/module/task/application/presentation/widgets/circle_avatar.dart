import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.onTap,
    this.child,
    required this.backgroundColor,
    required this.backgroundColorInner,
  });
  final VoidCallback onTap;
  final Widget? child;
  final Color backgroundColor;
  final Color backgroundColorInner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 24,
        child: CircleAvatar(
          radius: 16,
          backgroundColor: backgroundColorInner,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 14,
            child: child ??
                const Icon(
                  Icons.notifications,
                  color: neonShade,
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
