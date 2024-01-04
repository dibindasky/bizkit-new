import 'package:animate_do/animate_do.dart';
import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/indicator_skip_continue.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BusinessDetails extends StatelessWidget {
  BusinessDetails({super.key, required this.pageController});
  final PageController pageController;

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode focusScope = FocusScope.of(context);
          if (!focusScope.hasPrimaryFocus) {
            focusScope.unfocus();
          }
        },
        child: ListView(
          children: [
            adjustHieght(khieght * .03),
            const Text(
              'Business Details',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            TTextFormField(
              text: 'Name',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Designation',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Company',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Mail ID',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Mobile number',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),TTextFormField(
              text: 'Social Media Handles',
              controller: textEditingController,
              inputType: TextInputType.name,
              suffix: const Icon(
              Icons.keyboard_arrow_right,
            ),
            ),
            TTextFormField(
              text: 'Address',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Website link',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            adjustHieght(khieght * .02),
            SkipContinueIndicator(pageController: pageController),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
