import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:bizkit/domain/core/di/dipendency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await configuteInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Main');
    final size = MediaQuery.of(context).size;
    khieght = size.height;
    kwidth = size.width;

    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ContactsBloc>()),
          BlocProvider(create: (context) => getIt<CardScreationBloc>()),
        ],
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
      ),
    );
  }
}
