import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textField.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonlDetails extends StatelessWidget {
  PersonlDetails({super.key, required this.pageController});

  final PageController pageController;
  final GlobalKey<FormState> personalDeatilFormKey = GlobalKey();

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
        child: Form(
          key: personalDeatilFormKey,
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
              BlocBuilder<UserDataBloc, UserDataState>(
                builder: (context, state) {
                  return AutocompleteTextField(
                    autocompleteItems:
                        state.scannedImageDatasModel?.unknown ?? [],
                    showDropdownOnTap: true,
                    validate: Validate.none,
                    maxLines: 2,
                    label: 'Home address',
                    textCapitalization: TextCapitalization.words,
                    maxLength: 250,
                    controller: context.read<UserDataBloc>().homeAddress,
                    inputType: TextInputType.name,
                  );
                },
              ),
              // blood group selection
              AutocompleteTextField(
                validate: Validate.notNull,
                enabled: false,
                autocompleteItems: bloodGroups,
                showDropdown: true,
                label: 'Blood Group *',
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
                      datePicker:
                          context.read<UserDataBloc>().birthDaycontroller,
                    );
                  },
                ),
                child: TTextFormField(
                  validate: Validate.notNull,
                  text: 'Birthday *',
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
                            fadePageRoute(AccolodesScreen(
                                cardId: state.currentCard!.id!)),
                          ),
                      onItemTap: (value) => Navigator.push(
                          context,
                          fadePageRoute(ScreenImagePreview(
                              image: value, isFileIamge: false))),
                      removeItem: (index) {
                        showCustomConfirmationDialoge(
                            context: context,
                            title: 'are you sure want to delete ?',
                            buttonText: 'Delete',
                            onTap: () {
                              context.read<UserDataBloc>().add(
                                  UserDataEvent.removeAccolade(
                                      id: state.accolades[index].id!));
                            });
                      },
                      list: state.accolades
                          .map((e) => e.accoladesImage as String)
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Accolades',
                              style: custumText(
                                fontSize: 16,
                                colr: klightgrey,
                              ),
                            ),
                            const Icon(
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
                    removeItem: (index) {
                      showCustomConfirmationDialoge(
                          context: context,
                          title: 'are you sure want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            context.read<UserDataBloc>().add(
                                UserDataEvent.removeSocialMedia(
                                    id: state.socialMedias[index].id!));
                          });
                    },
                    ontap: () => Navigator.of(context).push(fadePageRoute(
                        SocialMediahandlesScreen(
                            fromBusiness: false,
                            cardId: state.currentCard!.id!))),
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
                            style: custumText(
                              fontSize: 16,
                              colr: klightgrey,
                            ),
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
                    removeItem: (index) {
                      showCustomConfirmationDialoge(
                          context: context,
                          title: 'are you sure want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            context.read<UserDataBloc>().add(
                                UserDataEvent.removeDateToRemember(
                                    id: state.datesToRemember[index].id!));
                          });
                    },
                    ontap: () {
                      Navigator.of(context).push(fadePageRoute(
                          DatesToRememberScreen(
                              cardId: state.currentCard!.id!)));
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
                            style: custumText(
                              fontSize: 16,
                              colr: klightgrey,
                            ),
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
              adjustHieght(khieght * .05),
              BlocConsumer<UserDataBloc, UserDataState>(
                listenWhen: (previous, current) =>
                    previous.personalData != current.personalData,
                listener: (context, state) {
                  if (state.personalData != null) {
                    //   pageController.nextPage(
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.ease,
                    //   );
                    context.read<CardBloc>().add(
                        CardEvent.getCardyCardId(id: state.currentCard!.id!));
                    // Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return LastSkipContinueButtons(
                    onTap: () {
                      if (personalDeatilFormKey.currentState!.validate()) {
                        context
                            .read<UserDataBloc>()
                            .add(UserDataEvent.createPersonalData());
                      }
                    },
                  );
                },
              ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
