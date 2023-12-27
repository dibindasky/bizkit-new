import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/authentication/view/screens/login_screen.dart';
import 'package:bizkit/feature/home/view/screen/home_screen_main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    kwidth = MediaQuery.of(context).size.width;
    khieght = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowMaterialGrid: false,
        theme: ThemeData(
          fontFamily: 'Euclid',
          scaffoldBackgroundColor: kblack,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kwhite,
                displayColor: kwhite,
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplitScreen(),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _animateToTop() {
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Screen
          Container(
            color: Colors
                .blue, // Replace with the color or widget of your background screen
            child: const Center(
              child: Text(
                'Behind Screen',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            children: [
              // Behind Screen (invisible initially)
              Container(color: Colors.transparent),
              // Top Screen
              Scaffold(
                appBar: AppBar(
                  title: const Text('Top Screen'),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _animateToTop();
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Move to Top'),
                  ),
                ),
              ),
            ],
          ),

          // Fade Transition
          AnimatedBuilder(
            animation: _fadeController,
            builder: (context, child) {
              return IgnorePointer(
                ignoring: _fadeController.value > 0.0,
                child: Opacity(
                  opacity: 1.0 - _fadeController.value,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }
}
