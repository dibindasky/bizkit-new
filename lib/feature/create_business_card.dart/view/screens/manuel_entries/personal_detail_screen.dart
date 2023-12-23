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
    return ListView(
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
        adjustHieght(khieght * .01),
        Container(
          decoration: const BoxDecoration(
            color: textFieldFillColr,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.only(left: 14),
          width: double.infinity,
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ICE Details',
                style: TextStyle(
                  fontSize: 15,
                  color: klightgrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: klightgrey,
              )
            ],
          ),
        ),
        adjustHieght(khieght * .02),
        Container(
          padding: const EdgeInsets.only(left: 14, top: 15),
          decoration: const BoxDecoration(
            color: textFieldFillColr,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          width: double.infinity,
          height: 50,
          child: const Text(
            'Photos',
            style: TextStyle(
              color: klightgrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        adjustHieght(khieght * .05),
        SkipContinueIndicator(pageController: pageController)
      ],
    );
  }
}
