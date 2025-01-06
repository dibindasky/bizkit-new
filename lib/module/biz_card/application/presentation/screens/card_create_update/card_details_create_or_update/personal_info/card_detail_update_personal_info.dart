import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/card_detail_update_button_container.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/skip_or_continue_button.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/widgets/image_or_text_preview_under_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardUpdatePersonalDetails extends StatelessWidget {
  CardUpdatePersonalDetails({super.key});
  final GlobalKey<FormState> personalDeatilFormKey = GlobalKey();
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();
  final GlobalKey<FormState> personalDataPhoneNumber = GlobalKey();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight20,
                Form(
                  key: personalDataFirstFormKey,
                  child: Column(
                    children: [
                      // user personal images
                      // GetBuilder<PersonalDetailsController>(builder: (contet) {
                      //   return ImagePreviewUnderTextField(
                      //     onItemTap: (item, index) {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => SlidablePhotoGallery(
                      //               images: personalController
                      //                   .personalImages.reversed
                      //                   .toList(),
                      //               initialIndex: index),
                      //         ),
                      //       );
                      //     },
                      //     removeItem: (index) => showCustomConfirmationDialogue(
                      //       context: context,
                      //       title: 'Remove image?',
                      //       buttonText: 'Remove',
                      //       onTap: () {
                      //         personalController.removePersonalImages(index);
                      //       },
                      //     ),
                      //     list: personalController.personalImages.reversed
                      //         .toList(),
                      //     ontap: () {
                      //       cameraAndGalleryPickImage(
                      //           tittle: 'Add Personal Images',
                      //           context: context,
                      //           onPressCam: () {
                      //             personalController.personalImagesAdding(true);
                      //           },
                      //           onPressGallery: () {
                      //             personalController
                      //                 .personalImagesAdding(false);
                      //           });
                      //     },
                      //     child: const CustomTextFormField(
                      //       suffixIcon: Icon(Icons.add_a_photo_outlined),
                      //       enabled: false,
                      //       labelText: 'Personal Imges',
                      //     ),
                      //   );
                      // }),

                      // GetX<PersonalDetailsController>(
                      //   builder: (_) {
                      // return
                      // personal imags
                      Obx(
                        () => Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                (personalController.personalImages.isNotEmpty ||
                                        cardController
                                                .bizcardDetail
                                                .value
                                                .personalDetails!
                                                .images
                                                ?.isNotEmpty ==
                                            true)
                                    ? GoRouter.of(context).pushNamed(
                                        Routes.slidablePhotoGallery,
                                        extra: {
                                            'images': personalController
                                                    .personalImages.isNotEmpty
                                                ? personalController
                                                    .personalImages
                                                : cardController
                                                            .bizcardDetail
                                                            .value
                                                            .personalDetails
                                                            ?.images
                                                            ?.isNotEmpty ??
                                                        false
                                                    ? cardController
                                                        .bizcardDetail
                                                        .value
                                                        .personalDetails
                                                        ?.images
                                                    : null,
                                            'initial': 0,
                                            'memory': personalController
                                                    .personalImages.isNotEmpty
                                                ? true
                                                : false,
                                          })
                                    : null;
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                    image: personalController
                                            .personalImages.isEmpty
                                        ? null
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: MemoryImage(base64Decode(
                                                personalController
                                                    .personalImages.first))),
                                    borderRadius: BorderRadius.circular(100.h),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                child:
                                    personalController.personalImages.isNotEmpty
                                        ? null
                                        : (cardController
                                                    .bizcardDetail
                                                    .value
                                                    .personalDetails
                                                    ?.images
                                                    ?.isNotEmpty ??
                                                false)
                                            ? NetworkImageWithLoader(
                                                cardController
                                                    .bizcardDetail
                                                    .value
                                                    .personalDetails!
                                                    .images!
                                                    .first,
                                                radius: 100,
                                              )
                                            : Image.asset(iconPersonOutline,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              right: 5.h,
                              child: GestureDetector(
                                onTap: () {
                                  if (personalController
                                      .personalImages.isNotEmpty) {
                                    personalController.removePersonalImages(0);
                                  } else {
                                    cameraAndGalleryPickImage(
                                        tittle: 'Add Personal Image',
                                        context: context,
                                        onPressCam: () {
                                          personalController
                                              .personalImagesAdding(true);
                                        },
                                        onPressGallery: () {
                                          personalController
                                              .personalImagesAdding(false);
                                        });
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: kBorderRadius25,
                                  child: ColoredBox(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: personalController
                                              .personalImages.isNotEmpty
                                          ? const Icon(Icons.close)
                                          : Icon(Icons.add, size: 20.sp)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //       );
                        // },
                      ),
                      kHeight20,
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
                      Form(
                        key: personalDataPhoneNumber,
                        child: GetBuilder<PersonalDetailsController>(
                          id: 'personalPhoneNumber',
                          builder: (controller) =>
                              ImageOrTextPreviewUnderWidget(
                            // deleteItemLoadingIndex: 1,
                            listString: personalController.personalPhoneNumbers,
                            removeItem: (index) {
                              personalController
                                  .deletePersonalPhoneNumber(index);
                            },
                            child: AutocompleteTextField(
                              validate: Validate.phone,
                              suffixIcon: InkWell(
                                  onTap: () {
                                    if (personalDataPhoneNumber.currentState!
                                        .validate()) {
                                      FocusScopeNode().unfocus();
                                      personalController
                                          .addPeresonalPhoneNumber(
                                              context,
                                              personalController
                                                  .personalPhoneController
                                                  .text);
                                    }
                                  },
                                  child: const Icon(Icons.add)),
                              maxLength: 10,
                              label: 'Personal Phone Number',
                              controller:
                                  personalController.personalPhoneController,
                              inputType: TextInputType.phone,
                            ),
                          ),
                        ),
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
                  label: 'Home Address',
                  textCapitalization: TextCapitalization.words,
                  maxLength: 250,
                  controller: personalController.personlAddressController,
                  inputType: TextInputType.name,
                ),
                // blood group selection
                AutocompleteTextField(
                  validate: Validate.none,
                  enabled: false,
                  autocompleteItems: bloodGroups,
                  showDropdown: true,
                  label: 'Blood Group',
                  controller: personalController.bloodGroupController,
                  inputType: TextInputType.name,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                kHeight10,
                // date of birth
                InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DatePickingBottomSheet(
                          year: 100,
                          onPressed: (date) {
                            personalController.dOBController.text = date;
                          },
                          datePicker: personalController.dOBController,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    validate: Validate.none,
                    labelText: 'DOB',
                    enabled: false,
                    controller: personalController.dOBController,
                    inputType: TextInputType.name,
                  ),
                ),
                kHeight10,
                // my story
                CustomTextFormField(
                  validate: Validate.none,
                  labelText: 'My Story',
                  maxLines: 5,
                  controller: personalController.myStoryController,
                ),
                kHeight5,
                CardDetailEditingButtonContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Show my story to connections',
                          style: Theme.of(context).textTheme.displaySmall),
                      Obx(
                        () => Switch(
                          value:
                              personalController.showStoryToConnections.value,
                          onChanged: (value) {
                            personalController.showStoryToConnections.value =
                                value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight20,
                // personal achivements (accolades)
                Obx(
                  () => ImageOrTextPreviewUnderWidget(
                    deleteItemLoadingIndex: cardController.bizcardDetail.value
                        .personalDetails?.personalAchievements
                        ?.indexWhere(
                      (element) =>
                          element.id == personalController.deletingId.value,
                    ),
                    ontap: () async {
                      personalController.achivementDataClear();
                      await GoRouter.of(context)
                          .pushNamed(Routes.cardAchivementCreateUpdate, extra: {
                        'fromBusiness': false,
                      }).then((_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      });
                    },
                    onItemTap: (value, index) {
                      GoRouter.of(context)
                          .pushNamed(Routes.cardAchivementCreateUpdate, extra: {
                        'fromBusiness': false,
                        'achivement': cardController.bizcardDetail.value
                            .personalDetails?.personalAchievements?[index]
                      });
                    },
                    removeItem: (index) {
                      showCustomConfirmationDialogue(
                          context: context,
                          title: 'Are you sure you want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            PersonalAchieventDeletionModel
                                personalAchievementDeletion =
                                PersonalAchieventDeletionModel(
                                    personalDetailsId: cardController
                                        .bizcardDetail
                                        .value
                                        .personalDetails
                                        ?.id,
                                    personalAchievementId: cardController
                                        .bizcardDetail
                                        .value
                                        .personalDetails
                                        ?.personalAchievements?[index]
                                        .id);
                            personalController.personalAcheievementDeleting(
                                fromInner: false,
                                context: context,
                                personalAchievementDeletion:
                                    personalAchievementDeletion);
                          });
                    },
                    list: cardController.bizcardDetail.value.personalDetails
                            ?.personalAchievements
                            ?.map((e) => (e.images?.isEmpty) ?? true
                                ? ''
                                : e.images?[0] ?? '')
                            .toList() ??
                        [],
                    child: const CardDetailEditingButtonContainer(
                        text: 'Personal Achievements'),
                  ),
                ),
                kHeight20,
                // social media handles
                Obx(
                  () => ImageOrTextPreviewUnderWidget(
                      onItemTap: (value, index) {
                        final data = cardController.bizcardDetail.value
                            .personalDetails?.personalSocialMedia?[index];
                        showDailoges(context,
                            heading: 'Social Media',
                            tittle: "Name : ${data?.label ?? ''}",
                            desc: 'Link : ${data?.link ?? ''}');
                      },
                      listString: cardController.bizcardDetail.value
                              .personalDetails?.personalSocialMedia
                              ?.map((e) => e.label ?? '')
                              .toList() ??
                          [],
                      removeItem: (index) {
                        showCustomConfirmationDialogue(
                            context: context,
                            title: 'Are you sure you want to delete ?',
                            buttonText: 'Delete',
                            onTap: () {
                              Get.find<PersonalDetailsController>()
                                  .personalSocialMediaDelete(index,
                                      fromIner: false, context: context);
                            });
                      },
                      ontap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        GoRouter.of(context).pushNamed(
                            Routes.cardSocialMediaCreateUpdate,
                            extra: {'fromBusiness': false});
                      },
                      child: const CardDetailEditingButtonContainer(
                          text: 'Personal Social Media Handles')),
                ),
                kHeight20,
                // dates to remember
                Obx(
                  () => ImageOrTextPreviewUnderWidget(
                    listString: cardController.bizcardDetail.value
                            .personalDetails?.datesToRemember
                            ?.map((e) => DateTimeFormater.getDateByDayMonthYear(
                                e.date ?? ''))
                            .toList() ??
                        [],
                    removeItem: (index) {
                      showCustomConfirmationDialogue(
                          context: context,
                          title: 'Are you sure you want to delete ?',
                          buttonText: 'Delete',
                          onTap: () {
                            personalController.personalDatesToReminderDelete(
                                fromInner: false, index, context: context);
                          });
                    },
                    onItemTap: (value, index) {
                      final data = cardController.bizcardDetail.value
                          .personalDetails?.datesToRemember?[index];
                      showDailoges(context,
                          heading: 'Dates To Remember',
                          tittle:
                              "Date : ${DateTimeFormater.getDateByDayMonthYear(data?.date ?? '')}",
                          desc: 'Description : ${data?.description ?? ''}');
                    },
                    ontap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      GoRouter.of(context)
                          .pushNamed(Routes.cardDatesToRememberCreateUpdate);
                    },
                    child: const CardDetailEditingButtonContainer(
                        text: 'Dates To Remember'),
                  ),
                ),
                kHeight20,
                // continue button
                Obx(() => personalController.isLoading.value
                    ? const Center(child: LoadingAnimation())
                    : SkipOrContinueButtons(
                        continueText: 'Update',
                        onTap: () {
                          if (personalDeatilFormKey.currentState!.validate()) {
                            personalController.createPersonalDetails(
                                context: context,
                                bizcardId: cardController
                                        .bizcardDetail.value.bizcardId ??
                                    '',
                                personalDetailsId: cardController.bizcardDetail
                                        .value.personalDetails?.id ??
                                    '');
                          }
                        },
                      )),
                kHeight40,
              ],
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: kBorderRadius10,
                // border: Border.all(color: neonShade)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(heading,
                        style: Theme.of(context).textTheme.displayMedium),
                    kHeight10,
                    Text(tittle,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 12.sp)),
                    kHeight5,
                    Text(desc, style: Theme.of(context).textTheme.displaySmall)
                  ]),
            ),
          ));
}
