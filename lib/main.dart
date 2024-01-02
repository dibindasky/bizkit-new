import 'package:bizkit/core/const.dart';

import 'package:bizkit/feature/authentication/view/screens/login_screen.dart';

import 'package:bizkit/feature/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
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
          primaryColor: kblack,
          colorScheme: const ColorScheme.dark(primary: neonShade),
          scaffoldBackgroundColor: backgroundColour,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kwhite,
                displayColor: kwhite,
                fontFamily: 'Euclid',
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
