import 'package:bizkit/utils/constants/colors.dart';
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

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeController.forward(from: 0.5);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: textFieldFillColr),
        child: TabBar(
          onTap: (value) {
            FocusScope.of(context).unfocus();
            setState(() {
              _fadeController.forward(from: 0.5);
            });
          },
          dividerColor: knill,
          indicator: const BoxDecoration(),
          unselectedLabelColor: kwhite,
          indicatorColor: knill,
          controller: widget._tabController,
          labelColor: kwhite,
          tabs: [
            Container(
              width: kwidth * 0.5,
              decoration: widget._tabController.index == 0
                  ? const BoxDecoration(
                      color: neonShade,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )
                  : null,
              child: const Tab(text: 'Individual'),
            ),
            Container(
              width: kwidth * 0.5,
              decoration: widget._tabController.index == 1
                  ? const BoxDecoration(
                      color: neonShade,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )
                  : null,
              child: const Tab(text: 'Business'),
            ),
          ],
        ),
      ),
    );
  }
}
