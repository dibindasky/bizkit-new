import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/indicator_skip_continue.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonlDetails extends StatelessWidget {
  PersonlDetails({super.key, required this.pageController});

  TextEditingController bloodGroup = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController birthDaycontroller = TextEditingController();
  TextEditingController accoladesController = TextEditingController();
  TextEditingController datesToReminderController = TextEditingController();

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus the text fields when tapping outside
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: ListView(
        children: [
          adjustHieght(khieght * .04),
          const Text(
            'Personal Details',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          TTextFormField(
            text: 'Home address',
            controller: homeAddress,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Blood Group',
            controller: bloodGroup,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Birthday',
            controller: birthDaycontroller,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Accolades',
            controller: accoladesController,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Dates To Remember',
            controller: datesToReminderController,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'ICE Details',
            controller: datesToReminderController,
            inputType: TextInputType.name,
            suffix: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          TTextFormField(
            text: 'Photos',
            controller: datesToReminderController,
            inputType: TextInputType.name,
          ),
          adjustHieght(khieght * .05),
          SkipContinueIndicator(pageController: pageController),
          adjustHieght(khieght * .02),
        ],
      ),
    );
  }
}
