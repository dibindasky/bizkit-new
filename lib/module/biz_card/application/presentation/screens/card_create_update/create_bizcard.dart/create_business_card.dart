import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/skip_or_continue_button.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardCreateDetailScreen extends StatefulWidget {
  const BizCardCreateDetailScreen({super.key});

  @override
  State<BizCardCreateDetailScreen> createState() =>
      _BizCardCreateDetailScreenState();
}

class _BizCardCreateDetailScreenState extends State<BizCardCreateDetailScreen> {
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    final cardController = Get.find<CardController>();
    final navbarController = Get.find<NavbarController>();
    final textExtractionController = Get.find<CardTextExtractionController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            kHeight10,
            Row(
              children: [
                kWidth20,
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                    cardController.nameController.clear();
                    cardController.phoneController.clear();
                    cardController.emailController.clear();
                    cardController.companyNameController.clear();
                    cardController.designationController.clear();
                    cardController.businessCategeryController.clear();
                    textExtractionController.pickedImageUrl.clear();
                    navbarController.slectedtabIndex.value = 1;
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15.sp,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                kWidth10,
                Text('Make a Bizkit Card',
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      kHeight20,
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
                        height: 150.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          image: const DecorationImage(
                              image: AssetImage(bizcardBgImage),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: knill,
                                  backgroundImage:
                                      AssetImage(iconPersonOutline),
                                ),
                                kWidth20,
                                Obx(() => Expanded(
                                      child: Text(
                                        !cardController
                                                    .updateCArdPreviewCardCreationNameLoading
                                                    .value &&
                                                cardController
                                                        .nameController.text ==
                                                    ''
                                            ? 'Name'
                                            : cardController
                                                .nameController.text,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ))
                              ],
                            ),
                            kHeight15,
                            Obx(() => Text(
                                  !cardController
                                              .updateCArdPreviewCardCreationEmailLoading
                                              .value &&
                                          cardController.emailController.text ==
                                              ''
                                      ? 'email@gmail.com'
                                      : cardController.emailController.text,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                            kHeight5,
                            Obx(() => Text(
                                  !cardController
                                              .updateCArdPreviewCardCreationPhoneLoading
                                              .value &&
                                          cardController.phoneController.text ==
                                              ''
                                      ? '0000 000 000'
                                      : cardController.phoneController.text,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                            kHeight10,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(() => Text(
                                    !cardController
                                                .updateCArdPreviewCardCreationDesignationLoading
                                                .value &&
                                            cardController.designationController
                                                    .text ==
                                                ''
                                        ? 'Manager'
                                        : cardController
                                            .designationController.text,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                            ),
                          ],
                        ),
                      ),
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
                              autocompleteItems:
                                  textExtractionController.extractedNames,
                              onChanged: (value) => cardController
                                  .updateCardPreviewCardCreation(cardController
                                      .updateCArdPreviewCardCreationNameLoading),
                            ),
                            // personal phone number
                            AutocompleteTextField(
                              validate: Validate.phone,
                              maxLength: 10,
                              label: 'Phone Number *',
                              controller: cardController.phoneController,
                              inputType: TextInputType.phone,
                              autocompleteItems: textExtractionController
                                  .extractedPhoneNumbers,
                              onChanged: (value) => cardController
                                  .updateCardPreviewCardCreation(cardController
                                      .updateCArdPreviewCardCreationPhoneLoading),
                            ),
                            // personal email
                            AutocompleteTextField(
                              validate: Validate.email,
                              label: 'Email *',
                              controller: cardController.emailController,
                              inputType: TextInputType.emailAddress,
                              autocompleteItems:
                                  textExtractionController.extractedEmails,
                              onChanged: (value) => cardController
                                  .updateCardPreviewCardCreation(cardController
                                      .updateCArdPreviewCardCreationEmailLoading),
                            ),
                            //Company name
                            AutocompleteTextField(
                              showDropdownOnTap: true,
                              validate: Validate.notNull,
                              label: 'Company Name *',
                              textCapitalization: TextCapitalization.words,
                              controller: cardController.companyNameController,
                              autocompleteItems:
                                  textExtractionController.extractedCompany,
                            ),
                            // business category
                            AutocompleteTextField(
                                onTap: () => FocusManager.instance.primaryFocus
                                    ?.unfocus(),
                                enabled: false,
                                validate: Validate.notNull,
                                label: 'Business Category *',
                                controller:
                                    cardController.businessCategeryController,
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
                              autocompleteItems:
                                  textExtractionController.extractedDesignation,
                              onChanged: (value) => cardController
                                  .updateCardPreviewCardCreation(cardController
                                      .updateCArdPreviewCardCreationDesignationLoading),
                            ),
                            kHeight30,
                          ],
                        ),
                      ),
                      Obx(
                        () {
                          if (cardController.isLoading.value) {
                            return const LoadingAnimation();
                          }
                          return SkipOrContinueButtons(
                            continueText: 'Create Card',
                            onTap: () {
                              if (cardController.emailController.text.isEmpty ||
                                  cardController.businessCategeryController.text
                                      .isEmpty ||
                                  cardController
                                      .companyNameController.text.isEmpty ||
                                  cardController
                                      .designationController.text.isEmpty ||
                                  cardController.nameController.text.isEmpty ||
                                  cardController.phoneController.text.isEmpty) {
                                showSnackbar(context,
                                    message: 'Please Fill the Required Feilds');
                              }
                              if (personalDataFirstFormKey.currentState!
                                  .validate()) {
                                cardController.createCard(context);
                              }
                            },
                          );
                        },
                      ),
                      kHeight20,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
