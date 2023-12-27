import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

// ignore: must_be_immutable
class LoGInScreen extends StatefulWidget {
  LoGInScreen({super.key});

  @override
  State<LoGInScreen> createState() => _LoGInScreenState();
}

class _LoGInScreenState extends State<LoGInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;
  double initial = 0.0;
  double target = 0.0;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final alignments = [
    Alignment.center,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.topRight
  ];

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
    _controller.forward();
  }

  void animate(double t) {
    initial = target;
    target = t;
    _simulation = SpringSimulation(
      const SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0),
      initial,
      target,
      0.0,
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(6, 199, 172, 1),
                        Color.fromRGBO(6, 199, 172, 1),
                        Color.fromRGBO(6, 199, 172, .34),
                      ])),
                    ),
                    eyeCircleAnimated()
                  ],
                ),
              ),
              const Text(
                'Your key to your business',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TTextFormField(
                onTap: () {
                  setState(() {
                    animate(40);
                  });
                },
                text: 'Name',
                controller: nameController,
                inputType: TextInputType.name,
                obscureText: false,
              ),
              TTextFormField(
                onTap: () {
                  setState(() {
                    animate(-40);
                  });
                },
                text: 'Password',
                controller: passwordController,
                inputType: TextInputType.emailAddress,
                obscureText: true,
              ),
              const Text('Don\'t have an acount?'),
              adjustHieght(khieght * .01),
              InkWell(
                onTap: () => Navigator.push(
                    context, fadePageRoute(const SignInscreeen())),
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              adjustHieght(khieght * .04),
              AuthButton(
                text: 'Login',
                onTap: () => Navigator.of(context).push(
                  fadePageRoute(const StartingBusinessCardCreation()),
                ),
              ),
            ],
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
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(6, 199, 172, 1),
            Color.fromRGBO(6, 199, 172, 1),
            Color.fromRGBO(6, 199, 172, .34),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(kwidth))),
      child: CircleAvatar(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            _simulation.x(_controller.value);
            return Transform.translate(
              offset: Offset(0.0, _simulation.x(_controller.value)),
              child: Container(
                height: 20,
                width: 30,
                decoration: const BoxDecoration(
                  color: kblack,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
