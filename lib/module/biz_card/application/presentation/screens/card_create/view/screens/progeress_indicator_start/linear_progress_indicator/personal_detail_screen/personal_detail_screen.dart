import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/create_achievement_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achievements_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      controller: personalController.personalNameController,
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      // autocompleteItems: ['febin', 'sebin'],
                    ),
                    // personal phone number
                    AutocompleteTextField(
                      validate: Validate.phone,
                      maxLength: 10,
                      label: 'Personal Phone Number',
                      controller: personalController.personalPhoneController,
                      inputType: TextInputType.phone,
                      //autocompleteItems: ['38947590', '837598'],
                    ),
                    // personal email
                    AutocompleteTextField(
                      validate: Validate.email,
                      label: 'Personal Email',
                      controller: personalController.personalEmailController,
                      inputType: TextInputType.emailAddress,
                      //autocompleteItems: ['Gmail', 'mail'],
                    ),
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
                controller: personalController.personlAddressController,
                inputType: TextInputType.name,
              ),
              // blood group selection
              AutocompleteTextField(
                validate: Validate.notNull,
                enabled: false,
                autocompleteItems: bloodGroups,
                showDropdown: true,
                label: 'Blood Group',
                controller: personalController.bloodGroupController,
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
                          personalController.dOBController.text = date;
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
                  controller: personalController.dOBController,
                  inputType: TextInputType.name,
                ),
              ),
              adjustHieght(10),
              // accolades adding
              Obx(
                () => ImagePreviewUnderTextField(
                  ontap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(cardFadePageRoute(
                        const CardScreenAchievements(fromBusiness: false)));
                  },
                  onItemTap: (value, index) {
                    return Navigator.push(
                        context,
                        cardFadePageRoute(CardScreenAchievementsCreate(
                            achievement: cardController.bizcardDetail.value
                                .personalDetails?.personalAchievements?[index],
                            fromBusiness: false)));
                  },
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                        context: context,
                        title: 'Are you sure want to delete ?',
                        buttonText: 'Delete',
                        onTap: () {
                          PersonalAchieventDeletionModel
                              personalAchievementDeletion =
                              PersonalAchieventDeletionModel(
                                  personalDetailsId: cardController
                                      .bizcardDetail.value.personalDetails?.id,
                                  personalAchievementId: cardController
                                      .bizcardDetail
                                      .value
                                      .personalDetails
                                      ?.personalAchievements?[index]
                                      .id);
                          personalController.personalAcheievementDeleting(
                              personalAchievementDeletion:
                                  personalAchievementDeletion);
                        });
                  },
                  list: cardController.bizcardDetail.value.personalDetails
                          ?.personalAchievements
                          ?.map((e) => (e.images?.isEmpty) ?? true
                              ? ''
                              : e.images?[0].image ?? '')
                          .toList() ??
                      [],
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
              ),
              adjustHieght(20),
              // social media handles
              Obx(
                () => ImagePreviewUnderTextField(
                  onItemTap: (value, index) {
                    final data = cardController.bizcardDetail.value
                        .personalDetails?.personalSocialMedia?[index];
                    showDailoges(context,
                        heading: 'Social Media',
                        tittle: "Name : ${data?.label ?? ''}",
                        desc: 'Link : ${data?.link ?? ''}');
                  },
                  listString: cardController.bizcardDetail.value.personalDetails
                          ?.personalSocialMedia
                          ?.map((e) => e.label ?? '')
                          .toList() ??
                      [],
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                        context: context,
                        title: 'Are you sure want to delete ?',
                        buttonText: 'Delete',
                        onTap: () {
                          Get.find<PersonalDetailsController>()
                              .personalDatesToReminderDelete(index);
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
              ),
              adjustHieght(20),
              // dates to remember
              Obx(
                () => ImagePreviewUnderTextField(
                  listString: cardController
                          .bizcardDetail.value.personalDetails?.datesToRemember
                          ?.map((e) => getDateByDayMonthYear(e.date ?? ''))
                          .toList() ??
                      [],
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                        context: context,
                        title: 'are you sure want to delete ?',
                        buttonText: 'Delete',
                        onTap: () {
                          personalController
                              .personalDatesToReminderDelete(index);
                        });
                  },
                  onItemTap: (value, index) {
                    final data = cardController.bizcardDetail.value
                        .personalDetails?.datesToRemember?[index];
                    showDailoges(context,
                        heading: 'Dates To Remember',
                        tittle:
                            "Date : ${getDateByDayMonthYear(data?.date ?? '')}",
                        desc: 'Description : ${data?.description ?? ''}');
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
                        const Icon(Icons.arrow_forward_ios_rounded,
                            size: 16, color: klightgrey)
                      ],
                    ),
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
                        personalController.createPersonalDetails(
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

Future<dynamic> showDailoges(BuildContext context,
    {required String heading, required tittle, required String desc}) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: neonShade)),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  heading,
                  style: TextStyle(fontSize: 14.sp),
                ),
                adjustHieght(10),
                Text(tittle),
                adjustHieght(5),
                Text(desc)
              ]),
            ),
          ));
}