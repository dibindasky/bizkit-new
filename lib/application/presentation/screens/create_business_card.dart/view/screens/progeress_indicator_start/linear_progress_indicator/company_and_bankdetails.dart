import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyAndBankingDetails extends StatelessWidget {
  CompanyAndBankingDetails({super.key, required this.pageController});

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
            adjustHieght(khieght * .04),
            const Text(
              'Company & Banking Details',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            TTextFormField(
              text: 'Name of the company',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Bank Details',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'UPI Details',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'GST Membership Details',
              controller: textEditingController,
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
                      'Accredition Details',
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
            adjustHieght(10),
            TTextFormField(
              text: 'Branch Offices',
              controller: textEditingController,
              inputType: TextInputType.name,
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
