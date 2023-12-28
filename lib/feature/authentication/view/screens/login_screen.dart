import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
                child: Hero(
                  tag: 'eye',
                  transitionOnUserGestures: true,
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return Image.asset(eyes[index]);
                  },
                  createRectTween: (begin, end) {
                    return Tween(begin: Rect.zero, end: Rect.largest);
                  },
                  child: Image.asset(eyes[index]),
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
                    animate(-28, 20);
                  });
                },
                onChanaged: (name) {
                  double newXPosition = -28 + (name.length * 1.5);
                  double newYPosition = 20 + (name.length * 0.5);
                  setState(() {
                    animate(newXPosition, newYPosition);
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
                    animate(30, -20);
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
                  child: const SizedBox(
                      height: 10,
                      width: 10,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ColoredBox(color: kwhite),
                        ),
                      ))),
            );
          },
        ),
      ),
    );
  }
}
