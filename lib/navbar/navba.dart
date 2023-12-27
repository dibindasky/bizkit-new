import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/card_share/view/screen/card_screen_main.dart';
import 'package:bizkit/feature/home/view/screen/home_screen_main.dart';
import 'package:bizkit/feature/profile_screen/view/screen/home_main_screen.dart';
import 'package:bizkit/feature/selfie_card/view/selfie_screen.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BizkitBottomNavigationBar extends StatefulWidget {
  const BizkitBottomNavigationBar({super.key});

  @override
  State<BizkitBottomNavigationBar> createState() =>
      _BizkitBottomNavigationBarState();
}

class _BizkitBottomNavigationBarState extends State<BizkitBottomNavigationBar> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const SplitScreen(),
    const CardShareMainScreen(),
    const SelfieScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: kblack,
        selectedIndex: _selectedIndex,
        items: [
          BottomBarItem(
            iconBuilder: (color) => Image.asset(
              'asset/images/NavPngs/—Pngtree—vector house icon_4013710.png',
              fit: BoxFit.cover,
              color: _selectedIndex == 0 ? kgreen : color,
              height: _selectedIndex == 0 ? 38 : 30,
              width: _selectedIndex == 0 ? 38 : 30,
            ),
          ),
          BottomBarItem(
            iconBuilder: (color) => Image.asset(
              'asset/images/NavPngs/my connection selected.png',
              fit: BoxFit.cover,
              color: _selectedIndex == 1 ? kgreen : color,
              height: _selectedIndex == 1 ? 32 : 26,
              width: _selectedIndex == 1 ? 32 : 26,
            ),
          ),
          BottomBarItem(
            iconBuilder: (color) => Image.asset(
              'asset/images/NavPngs/selfie selected.png',
              fit: BoxFit.cover,
              color: _selectedIndex == 2 ? kgreen : color,
              height: _selectedIndex == 2 ? 27 : 22,
              width: _selectedIndex == 2 ? 27 : 22,
            ),
          ),
          BottomBarItem(
            iconBuilder: (color) => Image.asset(
              'asset/images/NavPngs/account un selected.png',
              fit: BoxFit.cover,
              color: _selectedIndex == 3 ? kgreen : color,
              height: _selectedIndex == 3 ? 30 : 26,
              width: _selectedIndex == 3 ? 30 : 26,
            ),
          ),
        ],
        onSelect: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}

class HomeScreenn extends StatelessWidget {
  const HomeScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
