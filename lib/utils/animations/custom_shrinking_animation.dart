import 'dart:ui';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AnimatedGrowShrinkContainer extends StatefulWidget {
  final Widget child;
  final int milliseconds;
  final double begin;
  final double end;
  final Color backgroundColor;
  final bool animate; // New boolean flag

  const AnimatedGrowShrinkContainer({
    Key? key,
    required this.child,
    this.milliseconds = 1500,
    this.begin = 1.0,
    this.end = 0.8,
    this.backgroundColor = Colors.transparent,
    this.animate = false, // Default to false
  }) : super(key: key);

  @override
  State<AnimatedGrowShrinkContainer> createState() =>
      _AnimatedGrowShrinkContainerState();
}

class _AnimatedGrowShrinkContainerState
    extends State<AnimatedGrowShrinkContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));
    _scaleAnimation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(_controller)
      ..addListener(() => setState(() {}));

    if (widget.animate) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedGrowShrinkContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animate != widget.animate) {
      if (widget.animate) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}



class BlurMaker extends StatelessWidget {
  const BlurMaker({super.key, required this.child, required this.show});

  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(visible: !show, child: child),
        Visibility(
          visible: show,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: child,
          ),
        ),
      ],
    );
  }
}