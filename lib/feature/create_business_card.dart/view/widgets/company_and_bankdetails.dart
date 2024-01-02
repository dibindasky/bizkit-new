import 'package:animate_do/animate_do.dart';
import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/indicator_skip_continue.dart';
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
            TTextFormField(
              text: 'Accredition Details',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Branch Offices',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Products',
              controller: textEditingController,
              inputType: TextInputType.name,
            ),
            adjustHieght(khieght * .05),
            SkipContinueIndicator(pageController: pageController),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
