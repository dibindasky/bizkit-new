import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/indicator_skip_continue.dart';
import 'package:flutter/material.dart';

class Personality extends StatelessWidget {
  const Personality({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Personality',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .04),
          Container(
            color: textFieldFillColr,
            child: const Hero(tag: 'information',
              child: TextField(
                maxLines: 17,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText:
                      "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
          ),
          adjustHieght(khieght * .05),
          SkipContinueIndicator(pageController: pageController),
        ],
      ),
    );
  }
}
