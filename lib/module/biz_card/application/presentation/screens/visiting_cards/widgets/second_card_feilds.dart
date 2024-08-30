import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/visiting_card/visiting_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/visiting_screen.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardSecondScannedDatas extends StatelessWidget {
  CardSecondScannedDatas({super.key});
  final GlobalKey<FormState> autoFillDataKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final visitingCardController = Get.find<VisitingCardController>();

    final cardTextExtractionController =
        Get.find<CardTextExtractionController>();
    // final navbarController = Get.find<NavbarController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              visitingCardController.clearAllTextEditingControllers();
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          title: const Text(
            'Make Visting Card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: kwhite,
            ),
          ),
          backgroundColor: knill,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              cardTextExtractionController.pickedImageUrl.isEmpty
                  ? kempty
                  : SizedBox(
                      height: 250,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return adjustWidth(10);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            cardTextExtractionController.pickedImageUrl.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const SlidablePhotoGallery(
                              //       images: [],
                              //       initialIndex: 2,
                              //     ),
                              //   ),
                              // );
                            },
                            child: SizedBox(
                              height: 250,
                              width: kwidth,
                              child: Image.memory(
                                base64Decode(cardTextExtractionController
                                        .pickedImageUrl.first.base64 ??
                                    ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Form(
                  key: autoFillDataKey,
                  child: Column(
                    children: [
                      adjustHieght(khieght * 0.008),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        validate: Validate.notNull,
                        label: 'Name',
                        controller: visitingCardController.nameController,
                        // controller:
                        //  context.read<CardSecondBloc>().nameController,
                        inputType: TextInputType.name,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        validate: Validate.notNull,
                        label: 'Company',
                        controller:
                            visitingCardController.companyNameController,
                        // controller:
                        //  context.read<CardSecondBloc>().copanyController,
                        inputType: TextInputType.emailAddress,
                      ),
                      AutocompleteTextField(
                        //textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        validate: Validate.email,
                        label: 'Email',
                        controller: visitingCardController.emailController,
                        // controller:
                        // context.read<CardSecondBloc>().emailController,
                        inputType: TextInputType.emailAddress,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        maxLength: 10,
                        autocompleteItems: const [],
                        validate: Validate.phone,
                        label: 'Phone Number',
                        controller: visitingCardController.phoneController,
                        // controller:
                        // context.read<CardSecondBloc>().phoneController,
                        inputType: TextInputType.number,
                      ),
                      AutocompleteTextField(
                        autocompleteItems: const [],
                        validate: Validate.website,
                        label: 'Website',
                        controller: visitingCardController.websiteController,
                        // controller:
                        // context.read<CardSecondBloc>().webSiteController,
                        inputType: TextInputType.url,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        validate: Validate.notNull,
                        label: 'Designation',
                        // controller: context
                        // .read<CardSecondBloc>()
                        // .designationController,
                        controller:
                            visitingCardController.designationController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      CardLastSkipContinueButtons(
                        onTap: () {
                          if (autoFillDataKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            visitingCardController.getLocation();
                            Navigator.of(context).push(
                              cardFadePageRoute(const SelfieTextFields()),
                            );
                          }
                        },
                      ),
                      adjustHieght(20)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelfieTextFields extends StatefulWidget {
  const SelfieTextFields({
    super.key,
  });

  @override
  State<SelfieTextFields> createState() => _SelfieTextFieldsState();
}

class _SelfieTextFieldsState extends State<SelfieTextFields> {
  final GlobalKey<FormState> meetingDataKey = GlobalKey<FormState>();

  @override
  void initState() {
    // context.read<CardSecondBloc>().add(const CardSecondEvent.locationGeting());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    final visitingCardController = Get.find<VisitingCardController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          title: const Text(
            'Make Visting Card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: kwhite,
            ),
          ),
          backgroundColor: knill,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContainerPickImage(
                fromMain: false,
                onPressedGallery: () {
                  textExtractionController.pickSelfie(camera: false);
                },
                onPressedCam: () {
                  textExtractionController.pickSelfie(camera: true);
                },
                heading: 'Take Selfie',
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      textExtractionController.pickedSelfiesImageUrl.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              base64Decode(textExtractionController
                                  .pickedSelfiesImageUrl[index]),
                              height: 150.dm,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ColoredBox(
                                color: neonShade,
                                child: IconButton(
                                  onPressed: () {
                                    showCustomConfirmationDialogue(
                                      context: context,
                                      buttonText: 'Delete',
                                      title: 'You want to remove your selfie',
                                      onTap: () {
                                        textExtractionController
                                            .pickedSelfiesImageUrl
                                            .removeAt(index);
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    size: 30,
                                    color: kwhite,
                                    Icons.delete,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Form(
                  key: meetingDataKey,
                  child: Column(
                    children: [
                      adjustHieght(khieght * 0.008),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.words,
                        validate: Validate.notNull,
                        labelText: 'Occasion',
                        controller: visitingCardController.occasionController,
                        inputType: TextInputType.name,
                      ),
                      CustomTextFormField(
                        maxLines: 2,
                        suffixIcon: null,
                        textCapitalization: TextCapitalization.sentences,
                        validate: Validate.notNull,
                        labelText: 'Location',
                        controller: visitingCardController.locationController,
                        inputType: TextInputType.name,
                      ),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.words,
                        validate: Validate.notNull,
                        labelText: 'Occupation',
                        controller: visitingCardController.occupationController,
                        inputType: TextInputType.name,
                      ),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        validate: Validate.notNull,
                        maxLines: 3,
                        labelText: 'Notes',
                        controller: visitingCardController.notesController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      Obx(
                        () => visitingCardController.isLoading.value
                            ? const LoadingAnimation()
                            : CardLastSkipContinueButtons(
                                continueText: 'Create Visiting Card',
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (meetingDataKey.currentState!.validate()) {
                                    visitingCardController.createVisitingCard(
                                        context: context);
                                  }
                                }),
                      ),
                      kHeight10
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
