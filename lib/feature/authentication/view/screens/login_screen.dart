import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoGInScreen extends StatefulWidget {
  LoGInScreen({super.key});

  @override
  State<LoGInScreen> createState() => _LoGInScreenState();
}

class _LoGInScreenState extends State<LoGInScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final eyes = [
    'asset/images/eyes_straight.png',
    'asset/images/eyes_look_left.png',
    'asset/images/eyes_look_down.png',
    'asset/images/eyes_look_up.png'
  ];
  int index = 0;
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
                    flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                      return Image.asset(eyes[index]);
                    },
                    createRectTween: (begin, end) {
                      return Tween(begin: Rect.zero, end: Rect.largest);
                    },
                    child: Image.asset(eyes[index])),
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
                    index = 1;
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
                    index = 3;
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
}
