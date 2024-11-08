import 'package:bizkit/core/dipendency/binding/all_controller_binding.dart';
import 'package:bizkit/core/routes/route_generator.dart';
// import 'package:bizkit/core/themes/app_themes.dart';
import 'package:bizkit/firebase_options.dart';
import 'package:bizkit/module/module_manager/application/controller/text_style_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp(connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.connectivity});
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    final TextStyleController textStyleController =
        Get.put(TextStyleController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp.router(
        debugShowMaterialGrid: false,
        theme: ThemeData(
          primaryColor: kblack,
          colorScheme: const ColorScheme.dark(primary: neonShade),
          scaffoldBackgroundColor: kblack,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kwhite,
                displayColor: kwhite,
                fontFamily: textStyleController.textStyle.value,
              ),
        ),
        // theme: AppThemes.lightTheme(),
        // darkTheme: AppThemes.darkTheme(),
        initialBinding: AllControllerBinding(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: GoRouterConfig.router.routeInformationParser,
        routeInformationProvider:
            GoRouterConfig.router.routeInformationProvider,
        routerDelegate: GoRouterConfig.router.routerDelegate,
      ),
    );
  }
}
