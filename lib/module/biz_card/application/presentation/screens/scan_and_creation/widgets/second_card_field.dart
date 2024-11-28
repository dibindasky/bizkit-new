import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/scan_and_create.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
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
    final receivedCardController = Get.find<ReceivedCardController>();

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
              receivedCardController.clearAllTextEditingControllers();
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          title: Text(
            'Make Received Card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
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
                        controller: receivedCardController.nameController,
                        // controller:
                        //  context.read<CardSecondBloc>().nameController,
                        inputType: TextInputType.name,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        // validate: Validate.notNull,
                        label: 'Company',
                        controller:
                            receivedCardController.companyNameController,
                        // controller:
                        //  context.read<CardSecondBloc>().copanyController,
                        inputType: TextInputType.emailAddress,
                      ),
                      AutocompleteTextField(
                        //textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        // validate: Validate.email,
                        label: 'Email',
                        controller: receivedCardController.emailController,
                        // controller:
                        // context.read<CardSecondBloc>().emailController,
                        inputType: TextInputType.emailAddress,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        maxLength: 10,
                        autocompleteItems: const [],
                        // validate: Validate.phone,
                        label: 'Phone Number',
                        controller: receivedCardController.phoneController,
                        // controller:
                        // context.read<CardSecondBloc>().phoneController,
                        inputType: TextInputType.number,
                      ),
                      AutocompleteTextField(
                        autocompleteItems: const [],
                        // validate: Validate.website,
                        label: 'Website',
                        controller: receivedCardController.websiteController,
                        // controller:
                        // context.read<CardSecondBloc>().webSiteController,
                        inputType: TextInputType.url,
                      ),
                      AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                        // validate: Validate.notNull,
                        label: 'Designation',
                        // controller: context
                        // .read<CardSecondBloc>()
                        // .designationController,
                        controller:
                            receivedCardController.designationController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      CardLastSkipContinueButtons(
                        onTap: () {
                          if (autoFillDataKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            receivedCardController.getLocation();
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
    final receivedCardController = Get.find<ReceivedCardController>();
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
          title: Text(
            'Make Received Card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: knill,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ContainerPickImage(
              //   fromMain: false,
              //   onPressedGallery: () {
              //     textExtractionController.pickSelfie(camera: false);
              //   },
              //   onPressedCam: () {
              //     textExtractionController.pickSelfie(camera: true);
              //   },
              //   heading: 'Take Selfie',
              // ),
              Obx(
                () {
                  return SizedBox(
                    height: 170.dm,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 170.dm,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: textExtractionController
                                .pickedSelfiesImageUrl.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: AspectRatio(
                                  aspectRatio: 1.8 / 1,
                                  child: SizedBox(
                                    height: 170.dm,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.memory(
                                            base64Decode(
                                              textExtractionController
                                                  .pickedSelfiesImageUrl[index],
                                            ),
                                            height: 170.dm,
                                            width: 290.dm,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: ColoredBox(
                                                color: neonShade,
                                                child: IconButton(
                                                  onPressed: () {
                                                    showCustomConfirmationDialogue(
                                                      context: context,
                                                      buttonText: 'Delete',
                                                      title:
                                                          'You want to remove your selfie',
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            bottom: 20,
                          ),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  cameraAndGalleryPickImage(
                                      context: context,
                                      onPressCam: () {
                                        textExtractionController.pickSelfie(
                                            camera: true);
                                      },
                                      onPressGallery: () {
                                        textExtractionController.pickSelfie(
                                            camera: false);
                                      },
                                      tittle: "Choose image From");
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.add_a_photo_outlined),
                                ),
                              )),
                        )
                      ],
                    ),
                  );
                },
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
                        // validate: Validate.notNull,
                        labelText: 'Occasion',
                        controller: receivedCardController.occasionController,
                        inputType: TextInputType.name,
                      ),
                      CustomTextFormField(
                        maxLines: 2,
                        suffixIcon: null,
                        textCapitalization: TextCapitalization.sentences,
                        // validate: Validate.notNull,
                        labelText: 'Location',
                        controller: receivedCardController.locationController,
                        inputType: TextInputType.name,
                      ),
                      // CustomTextFormField(
                      //   textCapitalization: TextCapitalization.words,
                      //   // validate: Validate.notNull,
                      //   labelText: 'Occupation',
                      //   controller: receivedCardController.occupationController,
                      //   inputType: TextInputType.name,
                      // ),
                      CustomTextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        // validate: Validate.notNull,
                        maxLines: 3,
                        labelText: 'Notes',
                        controller: receivedCardController.notesController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      Obx(
                        () => receivedCardController.isLoading.value
                            ? const LoadingAnimation()
                            : CardLastSkipContinueButtons(
                                continueText: 'Create Received Card',
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (meetingDataKey.currentState!.validate() &&
                                      receivedCardController
                                          .locationController.text.isNotEmpty) {
                                    receivedCardController.createReceivedCard(
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
