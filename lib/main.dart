import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/business_logic/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/routes/route_generator.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/core/di/dipendency_injection.dart';
import 'package:bizkit/firebase_options.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();
    print('firebase notification token =>  "$token"');
  await configuteInjection();
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.connectivity});
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetConnectionCheckCubit>(
              create: (ctx) =>
                  InternetConnectionCheckCubit(connectivity: connectivity)),
          BlocProvider(create: (context) => getIt<ContactsBloc>()),
          BlocProvider(create: (context) => getIt<AuthBloc>()),
          BlocProvider(create: (context) => getIt<UserDataBloc>()),
          BlocProvider(create: (context) => getIt<BusinessDataBloc>()),
          BlocProvider(create: (context) => getIt<SignUpBloc>()),
          BlocProvider(create: (context) => getIt<CardBloc>()),
          BlocProvider(create: (context) => getIt<QrBloc>()),
          BlocProvider(create: (context) => getIt<ConnectionRequestBloc>()),
          BlocProvider(create: (context) => getIt<ReminderBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()),
        ],
        child: MaterialApp.router(
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
          routerConfig: GoRouterConfig.router,
          // routeInformationParser: GoRouterConfig.router.routeInformationParser,
          // routerDelegate: GoRouterConfig.router.routerDelegate,
        ),
      ),
    );
  }
}
