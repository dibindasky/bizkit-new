import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class CustomtabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomtabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Size get preferredSize => const Size.fromHeight(40.0);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomtabBar>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: TabBar(
        unselectedLabelColor: kwhite,
        indicatorColor: kgreen,
        controller: widget._tabController,
        tabs: const [
          Tab(text: 'Individuel'),
          Tab(text: 'Business'),
        ],
      ),
    );
  }
}
