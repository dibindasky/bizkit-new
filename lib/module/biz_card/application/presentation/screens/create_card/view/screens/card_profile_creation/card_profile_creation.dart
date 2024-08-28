import 'dart:convert';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenCardProfileCreation extends StatefulWidget {
  const ScreenCardProfileCreation({super.key});

  @override
  State<ScreenCardProfileCreation> createState() =>
      _ScreenCardProfileCreationState();
}

class _ScreenCardProfileCreationState extends State<ScreenCardProfileCreation> {
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    final cardController = Get.find<CardController>();
    final navbarController = Get.find<NavbarController>();
    final size = MediaQuery.of(context).size;
    final khieght = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            navbarController.slectedtabIndex.value = 1;
            GoRouter.of(context).pushNamed(Routes.bizCardNavbar);
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Make a Bizkit Card',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .03),
                // pick user photo
                Stack(
                  children: [
                    imageTestingBase64 == null
                        ? const CircleAvatar(
                            radius: 70,
                            backgroundColor: kblack,
                            backgroundImage: AssetImage(
                              'asset/images/profileCircle.png',
                            ),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundColor: kblack,
                            backgroundImage: MemoryImage(
                                base64.decode(getBase64(imageTestingBase64))),
                          ),
                    Positioned(
                      bottom: 17,
                      right: 3,
                      child: InkWell(
                        onTap: () {
                          // if (state.userPhotos != null) {
                          //   showCustomConfirmationDialogue(
                          //       context: context,
                          //       title: 'Remove profile image ?',
                          //       buttonText: 'Remove',
                          //       onTap: () {
                          //         context
                          //             .read<UserDataBloc>()
                          //             .add(UserDataEvent.removeUserPhoto());
                          //       });
                          // } else {
                          //   cameraAndGalleryPickImage(
                          //       context: context,
                          //       onPressCam: () {
                          //         context.read<UserDataBloc>().add(
                          //             UserDataEvent.pickUserPhotos(cam: true));
                          //       },
                          //       onPressGallery: () {
                          //         context.read<UserDataBloc>().add(
                          //             UserDataEvent.pickUserPhotos(cam: false));
                          //       });
                          // }
                        },
                        child: CircleAvatar(
                          radius: 13,
                          child: Icon(imageTestingBase64 != null
                              ? Icons.close
                              : Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
                adjustHieght(khieght * .04),

                // user data form
                Form(
                  key: personalDataFirstFormKey,
                  child: Column(
                    children: [
                      // personal name field
                      AutocompleteTextField(
                        validate: Validate.notNull,
                        label: 'Name *',
                        controller: cardController.nameController,
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: const [],
                      ),
                      // personal phone number
                      AutocompleteTextField(
                        validate: Validate.phone,
                        maxLength: 10,
                        label: 'Phone Number *',
                        controller: cardController.phoneController,
                        inputType: TextInputType.phone,
                        autocompleteItems: const [],
                      ),
                      // personal email
                      AutocompleteTextField(
                        validate: Validate.email,
                        label: 'Email *',
                        controller: cardController.emailController,
                        inputType: TextInputType.emailAddress,
                        autocompleteItems: const [],
                      ),
                      //Company name
                      AutocompleteTextField(
                        showDropdownOnTap: true,
                        validate: Validate.notNull,
                        label: 'Company Name *',
                        textCapitalization: TextCapitalization.words,
                        controller: cardController.companyNameController,
                        autocompleteItems: const <String>[],
                      ),
                      // business category
                      AutocompleteTextField(
                          onTap: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          enabled: false,
                          validate: Validate.notNull,
                          label: 'Business Category *',
                          controller: cardController.businessCategeryController,
                          autocompleteItems: const [
                            'Service',
                            'Product',
                            'Basics'
                          ]),
                      AutocompleteTextField(
                        showDropdownOnTap: true,
                        validate: Validate.notNull,
                        label: 'Designation *',
                        textCapitalization: TextCapitalization.words,
                        controller: cardController.designationController,
                        autocompleteItems: const <String>[],
                      ),
                      adjustHieght(khieght * .05),
                    ],
                  ),
                ),
                Obx(
                  () {
                    if (cardController.isLoading.value) {
                      return const LoadingAnimation();
                    }
                    return CardLastSkipContinueButtons(
                      continueText: 'Create Card',
                      onTap: () {
                        if (cardController.emailController.text.isEmpty ||
                            cardController
                                .businessCategeryController.text.isEmpty ||
                            cardController.companyNameController.text.isEmpty ||
                            cardController.designationController.text.isEmpty ||
                            cardController.nameController.text.isEmpty ||
                            cardController.phoneController.text.isEmpty) {
                          showSnackbar(context,
                              message: 'Please Fill the Required Feilds');
                        }
                        // context.push(Routes.bizCardNavbar);
                        if (personalDataFirstFormKey.currentState!.validate()) {
                          cardController.createCard(context);
                          // context.read<UserDataBloc>().add(UserDataEvent.createCard(
                          //     cardFirstCreationModel: CardFirstCreationModel(
                          //         cardJson: state.scannedImageDatasModel == null
                          //             ? null
                          //             : ExtractedTextModel(
                          //                 designations: state
                          //                     .scannedImageDatasModel
                          //                     ?.designations,
                          //                 emails: state
                          //                     .scannedImageDatasModel?.emails,
                          //                 names: state
                          //                     .scannedImageDatasModel?.names,
                          //                 phoneNumbers: state
                          //                     .scannedImageDatasModel?.phone,
                          //                 websites: state.scannedImageDatasModel
                          //                     ?.websites),
                          //         cardImage: state.scannedImagesCardCreation
                          //             .map((e) => ImageCard(image: e.base64))
                          //             .toList(),
                          //         name: context
                          //             .read<UserDataBloc>()
                          //             .nameController
                          //             .text
                          //             .trim(),
                          //         designation: context.read<UserDataBloc>().designationController.text.trim(),
                          //         phoneNumber: context.read<UserDataBloc>().phoneController.text.trim(),
                          //         email: context.read<UserDataBloc>().emailController.text.trim(),
                          //         photos: state.userPhotos ?? [],
                          //         businessCategoryId: state.businessCategories.firstWhere((element) => element.category == context.read<UserDataBloc>().businessCategoryController.text.trim()).id)));
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
      ),
    );
  }
}
