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
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final alignments = [
    Alignment.center,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.topRight
  ];
  int indexOfEye = 0;

  @override
  void initState() {
    nameFocusNode.addListener(() {
      if (!nameFocusNode.hasFocus) {
        // Center the eye when focus is lost
        setState(() {
          animate(0, 0);
          indexOfEye = 0;
        });
      }
    });

    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        // Center the eye when focus is lost
        setState(() {
          animate(0, 0);
          indexOfEye = 0;
        });
      }
    });
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
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              adjustHieght(khieght * .02),
              TTextFormField(
                focusNode: nameFocusNode,
                onTap: () {
                  setState(() {
                    if (nameController.text.isEmpty) {
                      animate(-28, 20);
                      indexOfEye = 1;
                    } else {
                      double newXPosition =
                          -28 + (nameController.text.length * 1.5);
                      double newYPosition =
                          20 + (nameController.text.length * 0.5);
                      animate(newXPosition, newYPosition);
                      indexOfEye = 1;
                    }
                  });
                },
                onChanaged: (name) {
                  double newXPosition = -28 + (name.length * 1.5);
                  double newYPosition = 20 + (name.length * 0.5);
                  setState(() {
                    animate(newXPosition, newYPosition);
                    indexOfEye = 1;
                  });
                },
                text: 'Name',
                controller: nameController,
                inputType: TextInputType.name,
                obscureText: false,
              ),
              TTextFormField(
                focusNode: passwordFocusNode,
                onTap: () {
                  setState(() {
                    indexOfEye = 3;
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
                child: Align(
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
