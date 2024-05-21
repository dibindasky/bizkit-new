import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_create_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_slidable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonlDetails extends StatelessWidget {
  PersonlDetails(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;
  final GlobalKey<FormState> personalDeatilFormKey = GlobalKey();
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

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
              //User info
              BlocBuilder<UserDataBloc, UserDataState>(
                builder: (context, state) {
                  return Form(
                    key: personalDataFirstFormKey,
                    child: Column(
                      children: [
                        // user personal images
                        BlocBuilder<UserDataBloc, UserDataState>(
                          builder: (context, state) {
                            return ImagePreviewUnderTextField(
                              onItemTap: (item, index) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SlidablePhotoGallery(
                                      images: state.personalImges.reversed.toList()
                                          .map((e) => e.image ?? '')
                                          .toList(),
                                      initialIndex: index,
                                    ),
                                  ),
                                );
                              },
                              removeItem: (index) =>
                                  showCustomConfirmationDialogue(
                                context: context,
                                title: 'Remove image?',
                                buttonText: 'Remove',
                                onTap: () {
                                  context.read<UserDataBloc>().add(
                                      UserDataEvent.removePersonalImage(
                                          id: state.personalImges[state.personalImges.length-index-1].id!));
                                },
                              ),
                              list: state.personalImges.reversed
                                  .map((e) => e.image ?? '')
                                  .toList(),
                              ontap: () {
                                cameraAndGalleryPickImage(
                                    context: context,
                                    onPressCam: () {
                                      context.read<UserDataBloc>().add(
                                          UserDataEvent.addPersonalImage(
                                              cam: true));
                                    },
                                    onPressGallery: () {
                                      context.read<UserDataBloc>().add(
                                          UserDataEvent.addPersonalImage(
                                              cam: false));
                                    });
                              },
                              child: const CustomTextFormField(
                                suffixIcon: Icon(Icons.add_a_photo_outlined),
                                enabled: false,
                                labelText: 'Personal Imges',
                              ),
                            );
                          },
                        ),
                        // personal name field
                        AutocompleteTextField(
                          validate: Validate.notNull,
                          label: 'Name',
                          controller:
                              context.read<UserDataBloc>().nameController,
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                        ),
                        // personal phone number
                        AutocompleteTextField(
                          validate: Validate.phone,
                          maxLength: 10,
                          label: 'Personal Phone Number',
                          controller:
                              context.read<UserDataBloc>().phoneController,
                          inputType: TextInputType.phone,
                          autocompleteItems:
                              state.scannedImageDatasModel?.phone ?? [],
                        ),
                        // personal email
                        AutocompleteTextField(
                          validate: Validate.email,
                          label: 'Personal Email',
                          controller:
                              context.read<UserDataBloc>().emailController,
                          inputType: TextInputType.emailAddress,
                          autocompleteItems:
                              state.scannedImageDatasModel?.emails ?? [],
                        ),
                        // business category
                        AutocompleteTextField(
                            onTap: () =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            enabled: false,
                            validate: Validate.notNull,
                            label: 'Business Category',
                            controller: context
                                .read<UserDataBloc>()
                                .businessCategoryController,
                            // inputType: TextInputType.name,
                            autocompleteItems: state.businessCategories
                                .map((e) => e.category!)
                                .toList()),
                        // designation
                        AutocompleteTextField(
                          showDropdownOnTap: true,
                          validate: Validate.notNull,
                          label: 'Designation',
                          textCapitalization: TextCapitalization.words,
                          controller: context
                              .read<UserDataBloc>()
                              .designationController,
                          autocompleteItems:
                              state.scannedImageDatasModel?.designations ??
                                  <String>[],
                        ),
                      ],
                    ),
                  );
                },
              ),
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
                label: 'Blood Group',
                controller: context.read<UserDataBloc>().bloodGroup,
                inputType: TextInputType.name,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              // date of birth
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  showModalBottomSheet(
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
                  );
                },
                child: CustomTextFormField(
                  validate: Validate.notNull,
                  labelText: 'Birthday',
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
                      ontap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(
                          fadePageRoute(
                              AccolodesScreen(cardId: state.currentCard!.id!)),
                        );
                      },
                      onItemTap: (value, index) {
                        return Navigator.push(
                            context,
                            fadePageRoute(AccoladesAddCreateScreen(
                              isAccolade: true,
                              cardId: state.currentCard!.id!,
                              accolade: state.accolades[index],
                            )));
                      },
                      removeItem: (index) {
                        showCustomConfirmationDialogue(
                            context: context,
                            title: 'are you sure want to delete ?',
                            buttonText: 'Delete',
                            onTap: () {
                              context.read<UserDataBloc>().add(
                                  UserDataEvent.removeAccolade(
                                      id: state.accolades[index].id!));
                            });
                      },
                      list: state.accolades.map((e) {
                        if (state.accolades.isEmpty) {
                          return null;
                        } else {
                          return e.images?[0].image as String;
                        }
                      }).toList(),
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
                              'Personal Achivements',
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
                      showCustomConfirmationDialogue(
                          context: context,
                          title: 'are you sure want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            context.read<UserDataBloc>().add(
                                UserDataEvent.removeSocialMedia(
                                    id: state.socialMedias[index].id!));
                          });
                    },
                    ontap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).push(fadePageRoute(
                          SocialMediahandlesScreen(
                              fromBusiness: false,
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
                            'Personal Social Media Handles',
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
                      showCustomConfirmationDialogue(
                          context: context,
                          title: 'are you sure want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            context.read<UserDataBloc>().add(
                                UserDataEvent.removeDateToRemember(
                                    id: state.datesToRemember[index].id!));
                          });
                    },
                    onItemTap: (value, index) {
                      final data = state.datesToRemember[index];
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      border: Border.all(color: neonShade)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Dates To Remember',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        adjustHieght(10),
                                        Text('Date : ${data.date ?? ''}'),
                                        adjustHieght(5),
                                        Text(data.label ?? '')
                                      ]),
                                ),
                              ));
                    },
                    ontap: () {
                      FocusScope.of(context).unfocus();
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
              // continue button
              BlocConsumer<UserDataBloc, UserDataState>(
                listenWhen: (previous, current) =>
                    previous.personalData != current.personalData,
                listener: (context, state) {
                  if (state.personalData != null) {
                    context.read<CardBloc>().add(
                        CardEvent.getCardyCardId(id: state.currentCard!.id!));
                    if (state.isBusiness && fromBusiness) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return LastSkipContinueButtons(
                    onTap: () {
                      // if (personalDeatilFormKey.currentState!.validate()) {
                      context
                          .read<UserDataBloc>()
                          .add(UserDataEvent.createPersonalData());
                      // }
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
