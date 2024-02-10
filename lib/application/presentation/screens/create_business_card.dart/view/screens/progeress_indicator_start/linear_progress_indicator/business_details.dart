import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key, required this.pageController});

  final PageController pageController;

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
              text: 'Business Name',
              controller:
                  context.read<BusinessDataBloc>().businessNameController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Designation',
              controller:
                  context.read<BusinessDataBloc>().designationController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Company',
              controller: context.read<BusinessDataBloc>().companyController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Mail ID',
              controller: context.read<BusinessDataBloc>().mailController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Mobile number',
              controller: context.read<BusinessDataBloc>().mobileController,
              inputType: TextInputType.name,
            ),
            adjustHieght(10),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(fadePageRoute(const SocialMediahandlesScreen(
                  fromBusiness: true,
                )));
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
            adjustHieght(10),
            TTextFormField(
              maxLines: 4,
              text: 'Address',
              controller: context.read<BusinessDataBloc>().addressController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'Website link',
              controller:
                  context.read<BusinessDataBloc>().websiteLinkController,
              inputType: TextInputType.name,
            ),
            adjustHieght(khieght * .02),
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
