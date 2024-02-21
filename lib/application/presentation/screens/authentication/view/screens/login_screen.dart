import 'dart:developer';

import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoGInScreen extends StatefulWidget {
  const LoGInScreen({super.key});

  @override
  State<LoGInScreen> createState() => _LoGInScreenState();
}

class _LoGInScreenState extends State<LoGInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;
  late SpringSimulation _simulationX;
  double initial = 0.0;
  double initialx = 0.0;
  double target = 0.0;
  double targetx = 0.0;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey();

  final alignments = [
    Alignment.center,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.topRight,
    Alignment.bottomRight
  ];
  int indexOfEye = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _simulation = SpringSimulation(
      const SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
      initial, // Initial position
      target, // Target position
      0.0, // Initial velocity (important!)
    );
    _simulationX = SpringSimulation(
      const SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
      initialx, // Initial position
      targetx, // Target position
      0.0, // Initial velocity (important!)
    );
    _controller.forward();
  }

  void animate(double targetX, double targety) {
    initial = target;
    target = targety;
    initialx = targetx;
    targetx = targetX;
    _simulation = SpringSimulation(
      const SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
      initial,
      target,
      0.0,
    );
    _simulationX = SpringSimulation(
      const SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
      initialx,
      targetX,
      0.0,
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
          setState(() {
            animate(0, 0);
            indexOfEye = 0;
          });
        }
      },
      child: BlocListener<InternetConnectionCheckCubit,
          InternetConnectionCheckState>(
        listener: (context, state) {
          if (state is InternetConnected) {
            log('Internet is connected');
          } else {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text('No internet'),
                  content: const Text(
                    'Please turn on mobile data or connect to a wifi',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Close'),
                    )
                  ],
                );
              },
            );
            log('internet is disconnected');
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        eyeCircleAnimated(),
                        Container(
                          width: kwidth * 0.05,
                          height: kwidth * 0.02,
                          decoration: BoxDecoration(
                            gradient: neonShadeGradient,
                          ),
                        ),
                        eyeCircleAnimated()
                      ],
                    ),
                  ),
                  Text(
                    'Your key to your business',
                    style: custumText(
                      fontSize: kwidth * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  adjustHieght(khieght * .02),
                  TTextFormField(
                    onTap: () {
                      setState(() {
                        if (emailController.text.isEmpty) {
                          animate(-28, 20);
                          indexOfEye = 1;
                        } else {
                          double newXPosition =
                              -28 + (emailController.text.length * 1.5);
                          double newYPosition =
                              20 + (emailController.text.length * 0.5);
                          if (newXPosition > 12 && newYPosition > 33) {
                            setState(() {
                              newXPosition = 12.0;
                              newYPosition = 33.0;
                              animate(newXPosition, newYPosition);
                              indexOfEye = 4;
                            });
                            return;
                          }
                          animate(newXPosition, newYPosition);
                          if (emailController.text.length > 22) {
                            indexOfEye = 4;
                          } else if (emailController.text.length >= 17) {
                            indexOfEye = 2;
                          } else {
                            indexOfEye = 1;
                          }
                        }
                      });
                    },
                    onChanaged: (name) {
                      double newXPosition = -28 + (name.length * 1.5);
                      double newYPosition = 20 + (name.length * 0.5);
                      if (newXPosition > 12 && newYPosition > 33) {
                        setState(() {
                          newXPosition = 12.0;
                          newYPosition = 33.0;
                          indexOfEye = 4;
                        });
                        return;
                      }
                      setState(() {
                        animate(newXPosition, newYPosition);
                        if (name.length >= 17) {
                          indexOfEye = 2;
                        } else {
                          indexOfEye = 1;
                        }
                      });
                    },
                    validate: Validate.email,
                    text: 'Email',
                    controller: emailController,
                    inputType: TextInputType.name,
                  ),
                  TTextFormField(
                    onTap: () {
                      setState(() {
                        indexOfEye = 3;
                        animate(30, -20);
                      });
                    },
                    validate: Validate.password,
                    text: 'Password',
                    controller: passwordController,
                    inputType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                  Text(
                    'Don\'t have an acount?',
                    style: TextStyle(
                      fontSize: kwidth * 0.026,
                    ),
                  ),
                  adjustHieght(khieght * .01),
                  InkWell(
                    onTap: () => Navigator.push(
                        context, fadePageRoute(const SignInscreeen())),
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: kwidth * 0.037,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  adjustHieght(khieght * .04),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.hasError || state.message != null) {
                        print('snack from loginScreen');
                        showSnackbar(context,
                            message: state.message!,
                            backgroundColor: state.hasError ? kred : neonShade,
                            textColor: kwhite);
                      }
                      if (state.loginResponseModel != null) {
                        Navigator.of(context).pushAndRemoveUntil(
                          fadePageRoute(const StartingBusinessCardCreation()),
                          (route) => true,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const LoadingAnimation();
                      }
                      return AuthButton(
                        text: 'Login',
                        onTap: () {
                          if (loginKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthEvent.login(
                                loginModel: LoginModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim())));
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container eyeCircleAnimated() {
    return Container(
      padding: const EdgeInsets.all(6),
      height: kwidth * 0.30,
      width: kwidth * 0.30,
      decoration: BoxDecoration(
        gradient: neonShadeGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(kwidth),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: kwhite.withOpacity(0.9),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            _simulation.x(_controller.value);
            return Transform.translate(
              offset: Offset(_simulationX.x(_controller.value),
                  _simulation.x(_controller.value)),
              child: Container(
                padding: const EdgeInsets.all(3),
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: kblack,
                  shape: BoxShape.circle,
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  alignment: alignments[indexOfEye],
                  child: const SizedBox(
                    height: 10,
                    width: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: ColoredBox(color: kwhite),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
