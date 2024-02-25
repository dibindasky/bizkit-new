import 'package:flutter/material.dart';

class AnimatedTabBar extends StatefulWidget {
  final List<Widget> children;
  final int initialIndex;
  final Color activeColor;
  final Color inactiveColor;
  final Duration animationDuration;
  final Function(int) onTap;

  const AnimatedTabBar({
    Key? key,
    required this.children,
    this.initialIndex = 0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.animationDuration = const Duration(milliseconds: 200),
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedTabBarState createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _animationController.forward();
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.children.length; i++)
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Expanded(
              child: MaterialButton(
                onPressed: () => _handleTap(i),
                color: _selectedIndex == i
                    ? Color.lerp(widget.inactiveColor, widget.activeColor, _animationController.value)
                    : widget.inactiveColor,
                child: child,
              ),
            ),
            child: widget.children[i],
          ),
      ],
    );
  }
}
