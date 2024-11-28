import 'package:flutter/material.dart';

class CustomLinearProgressBar extends StatefulWidget {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;
  final double height;

  const CustomLinearProgressBar({
    Key? key,
    required this.progress,
    this.height = 10,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _CustomLinearProgressBarState createState() =>
      _CustomLinearProgressBarState();
}

class _CustomLinearProgressBarState extends State<CustomLinearProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation =
        Tween<double>(begin: 0.0, end: widget.progress).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CustomLinearProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _controller.reset();
      _animation =
          Tween<double>(begin: oldWidget.progress, end: widget.progress)
              .animate(_controller)
            ..addListener(() {
              setState(() {});
            });
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FractionallySizedBox(
          widthFactor: _animation.value,
          child: Container(
            color: widget.progressColor,
          ),
        ),
      ),
    );
  }
}
