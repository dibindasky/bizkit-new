import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/photos/photos_adding.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
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
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            adjustHieght(10),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const AccolodesScreen()),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  boxShadow: [
                    BoxShadow(
                      color: textFieldFillColr,
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0.4, .2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 12, right: 12),
                height: 48.0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Accolades',
                      style: TextStyle(color: klightgrey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: klightgrey,
                    ),
                  ],
                ),
              ),
            ),
            adjustHieght(20),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(fadePageRoute(const SocialMediahandles()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  boxShadow: [
                    BoxShadow(
                      color: textFieldFillColr,
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0.4, .2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 12, right: 12),
                height: 48.0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Social Media Handles',
                      style: TextStyle(color: klightgrey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: klightgrey,
                    )
                  ],
                ),
              ),
            ),
            adjustHieght(20),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(fadePageRoute(const DatesToRemember()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  boxShadow: [
                    BoxShadow(
                      color: textFieldFillColr,
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0.4, .2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 12, right: 12),
                height: 48.0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dates To Remember',
                      style: TextStyle(color: klightgrey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: klightgrey,
                    )
                  ],
                ),
              ),
            ),
            adjustHieght(20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  fadePageRoute(const PhotosAddingScreen()),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  boxShadow: [
                    BoxShadow(
                      color: textFieldFillColr,
                      spreadRadius: 0.4,
                      blurRadius: 4,
                      offset: Offset(0.4, .2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 12, right: 12),
                height: 48.0,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Photos',
                      style: TextStyle(color: klightgrey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: klightgrey,
                    )
                  ],
                ),
              ),
            ),
            adjustHieght(khieght * .05),
            LastSkipContinueButtons(
              onTap: () => pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
            ),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
