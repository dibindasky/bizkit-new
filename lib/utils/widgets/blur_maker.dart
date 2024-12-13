import 'dart:ui';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/widgets.dart';

class BlurMaker extends StatelessWidget {
  const BlurMaker(
      {super.key,
      required this.child,
      required this.show,
      this.sigmaX = 5,
      this.sigmaY = 5});

  final Widget child;
  final bool show;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(visible: !show, child: child),
        Visibility(
          visible: show,
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
