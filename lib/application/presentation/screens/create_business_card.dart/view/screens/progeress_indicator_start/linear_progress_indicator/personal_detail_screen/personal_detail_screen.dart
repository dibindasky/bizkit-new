import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/photos/photos_adding.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textField.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonlDetails extends StatelessWidget {
  const PersonlDetails({super.key, required this.pageController});

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
            // home address text field
            TTextFormField(
              maxLines: 2,
              text: 'Home address',
              controller: context.read<UserDataBloc>().homeAddress,
              inputType: TextInputType.name,
            ),
            // blood group selection
            AutocompleteTextField(
              autocompleteItems: bloodGroups,
              showDropdown: true,
              label: 'Blood Group',
              controller: context.read<UserDataBloc>().bloodGroup,
              inputType: TextInputType.name,
            ),
            // date of birth
            InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return DatePickingBottomSheet(
                    year: 100,
                    onPressed: (date) {
                      context.read<UserDataBloc>().birthDaycontroller.text =
                          date;
                    },
                    datePicker: context.read<UserDataBloc>().birthDaycontroller,
                  );
                },
              ),
              child: TTextFormField(
                text: 'Birthday',
                enabled: false,
                controller: context.read<UserDataBloc>().birthDaycontroller,
                inputType: TextInputType.name,
              ),
            ),
            adjustHieght(10),
            // accolades adding
            BlocBuilder<UserDataBloc, UserDataState>(
              buildWhen: (previous, current) =>
                  previous.accolades.length != current.accolades.length,
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                    ontap: () => Navigator.of(context).push(
                          fadePageRoute(const AccolodesScreen()),
                        ),
                    list: state.accolades
                        .map((e) => e.accoladesImage as ImageModel)
                        .toList(),
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
                    ));
              },
            ),
            adjustHieght(20),
            // social media handles
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  listString: state.socialMedias
                      .map((e) => e.socialMedia ?? 'Social Media')
                      .toList(),
                  ontap: () => Navigator.of(context).push(fadePageRoute(
                      const SocialMediahandlesScreen(fromBusiness: false))),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Social Media Handles',
                          style: TextStyle(
                              color: state.socialMedias.isNotEmpty
                                  ? kwhite
                                  : klightgrey),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: klightgrey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            adjustHieght(20),
            // dates to remember
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  listString:
                      state.datesToRemember.map((e) => e.date!).toList(),
                  ontap: () {
                    Navigator.of(context)
                        .push(fadePageRoute(const DatesToRememberScreen()));
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dates To Remember',
                          style: TextStyle(
                              color: state.datesToRemember.isNotEmpty
                                  ? kwhite
                                  : klightgrey),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: klightgrey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            adjustHieght(20),
            // personal photos
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  ontap: () => Navigator.of(context).push(
                    fadePageRoute(const PhotosAddingScreen()),
                  ),
                  list: state.userPhotos,
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
                );
              },
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
