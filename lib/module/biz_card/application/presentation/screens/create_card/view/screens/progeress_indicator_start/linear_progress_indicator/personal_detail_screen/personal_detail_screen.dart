import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_create_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;
  final GlobalKey<FormState> personalDeatilFormKey = GlobalKey();
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final personalController = Get.find<PersonalDetailsController>();
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
              const Text('Personal Details', style: TextStyle(fontSize: 20)),
              adjustHieght(khieght * .02),
              //User info
              Form(
                key: personalDataFirstFormKey,
                child: Column(
                  children: [
                    // user personal images
                    GetBuilder<PersonalDetailsController>(builder: (contet) {
                      return ImagePreviewUnderTextField(
                        onItemTap: (item, index) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SlidablePhotoGallery(
                                  images: personalController.personalImages,
                                  initialIndex: index),
                            ),
                          );
                        },
                        removeItem: (index) => showCustomConfirmationDialogue(
                          context: context,
                          title: 'Remove image?',
                          buttonText: 'Remove',
                          onTap: () {
                            personalController.removePersonalImages(index);
                          },
                        ),
                        list: personalController.personalImages,
                        ontap: () {
                          cameraAndGalleryPickImage(
                              tittle: 'Add Personal Images',
                              context: context,
                              onPressCam: () {
                                personalController.personalImagesAdding(true);
                              },
                              onPressGallery: () {
                                personalController.personalImagesAdding(false);
                              });
                        },
                        child: const CustomTextFormField(
                          suffixIcon: Icon(Icons.add_a_photo_outlined),
                          enabled: false,
                          labelText: 'Personal Imges',
                        ),
                      );
                    }),
                    // personal name field
                    AutocompleteTextField(
                      validate: Validate.notNull,
                      label: 'Name',
                      controller: cardController.personalNameController,
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      // autocompleteItems: ['febin', 'sebin'],
                    ),
                    // personal phone number
                    AutocompleteTextField(
                      validate: Validate.phone,
                      maxLength: 10,
                      label: 'Personal Phone Number',
                      controller: cardController.personalPhoneController,
                      inputType: TextInputType.phone,
                      //autocompleteItems: ['38947590', '837598'],
                    ),
                    // personal email
                    AutocompleteTextField(
                      validate: Validate.email,
                      label: 'Personal Email',
                      controller: cardController.personalEmailController,
                      inputType: TextInputType.emailAddress,
                      //autocompleteItems: ['Gmail', 'mail'],
                    ),
                    // business category
                    // AutocompleteTextField(
                    //     onTap: () =>
                    //         FocusManager.instance.primaryFocus?.unfocus(),
                    //     enabled: false,
                    //     validate: Validate.notNull,
                    //     label: 'Business Category',
                    //     // controller: context
                    //     //     .read<UserDataBloc>()
                    //     //     .businessCategoryController,
                    //     // inputType: TextInputType.name,
                    //     autocompleteItems: const ['Categery', 'Rupees']),
                    // designation
                    // const AutocompleteTextField(
                    //   showDropdownOnTap: true,
                    //   validate: Validate.notNull,
                    //   label: 'Designation',
                    //   textCapitalization: TextCapitalization.words,
                    //   // controller:
                    //   //     context.read<UserDataBloc>().designationController,
                    //   autocompleteItems: <String>['Desig', 'Over all'],
                    // ),
                  ],
                ),
              ),
              // home address text field
              AutocompleteTextField(
                autocompleteItems: const [],
                showDropdownOnTap: true,
                validate: Validate.none,
                maxLines: 2,
                label: 'Home address',
                textCapitalization: TextCapitalization.words,
                maxLength: 250,
                controller: cardController.personlAddressController,
                inputType: TextInputType.name,
              ),
              // blood group selection
              AutocompleteTextField(
                validate: Validate.notNull,
                enabled: false,
                autocompleteItems: bloodGroups,
                showDropdown: true,
                label: 'Blood Group',
                controller: cardController.bloodGroupController,
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
                          cardController.dOBController.text = date;
                        },
                        datePicker: TextEditingController(),
                      );
                    },
                  );
                },
                child: CustomTextFormField(
                  validate: Validate.notNull,
                  labelText: 'DOB',
                  enabled: false,
                  controller: cardController.dOBController,
                  inputType: TextInputType.name,
                ),
              ),
              adjustHieght(10),
              // accolades adding
              ImagePreviewUnderTextField(
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(
                    cardFadePageRoute(const CardScreenAccolodes()),
                  );
                },
                onItemTap: (value, index) {
                  return Navigator.push(context,
                      cardFadePageRoute(const CardScreenAccoladesAddCreate()));
                },
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                      context: context,
                      title: 'are you sure want to delete ?',
                      buttonText: 'Delete',
                      onTap: () {
                        // context.read<UserDataBloc>().add(
                        //     UserDataEvent.removeAccolade(
                        //         id: state.accolades[index].id!));
                      });
                },
                list: const [],
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
                ),
              ),
              adjustHieght(20),
              // social media handles
              ImagePreviewUnderTextField(
                listString: const [],
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                      context: context,
                      title: 'are you sure want to delete ?',
                      buttonText: 'Delete',
                      onTap: () {
                        // context.read<UserDataBloc>().add(
                        //     UserDataEvent.removeSocialMedia(
                        //         id: state.socialMedias[index].id!));
                      });
                },
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(cardFadePageRoute(
                      const SocialMediahandlesScreen(fromBusiness: false)));
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
              ),
              adjustHieght(20),
              // dates to remember
              ImagePreviewUnderTextField(
                listString: const [],
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                      context: context,
                      title: 'are you sure want to delete ?',
                      buttonText: 'Delete',
                      onTap: () {
                        // context.read<UserDataBloc>().add(
                        //     UserDataEvent.removeDateToRemember(
                        //         id: state.datesToRemember[index].id!));
                      });
                },
                onItemTap: (value, index) {
                  // final data = state.datesToRemember[index];
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
                                    const Text('Date :'),
                                    adjustHieght(5),
                                    const Text('Lebal')
                                  ]),
                            ),
                          ));
                },
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context)
                      .push(cardFadePageRoute(const DatesToRememberScreen()));
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
              ),
              adjustHieght(khieght * .05),
              // continue button
              Obx(
                () {
                  if (cardController.isLoading.value) {
                    return const LoadingAnimation();
                  }
                  return CardLastSkipContinueButtons(
                    onTap: () {
                      if (personalDeatilFormKey.currentState!.validate()) {
                        cardController.createPersonalDetails(
                            bizcardId:
                                cardController.bizcardDetail.value.bizcardId ??
                                    '',
                            personalDetailsId: cardController
                                    .bizcardDetail.value.personalDetails?.id ??
                                '');
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
