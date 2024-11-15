import 'package:bizkit/core/routes/routes.dart';
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
            cardController.nameController.clear();
            cardController.phoneController.clear();
            cardController.emailController.clear();
            cardController.companyNameController.clear();
            cardController.designationController.clear();
            cardController.businessCategeryController.clear();
            textExtractionController.pickedImageUrl.clear();
            navbarController.slectedtabIndex.value = 1;
            GoRouter.of(context).pushNamed(Routes.bizCardNavbar);
          },
          color: kwhite,
        ),
        title: Text(
          'Make a Bizkit Card',
          style: textHeadStyle1,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
            children: [
              kWidth20,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
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
              Text('Edit Card',
                  style: Theme.of(context).textTheme.displayMedium)
            ],
          ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    children: [
                      kHeight20,
                      // pick user photo
                      // Stack(
                      //   children: [
                      //     imageTestingBase64 == null
                      //         ? const CircleAvatar(
                      //             radius: 70,
                      //             backgroundColor: kblack,
                      //             backgroundImage: AssetImage(
                      //               'asset/images/profileCircle.png',
                      //             ),
                      //           )
                      //         : CircleAvatar(
                      //             radius: 70,
                      //             backgroundColor: kblack,
                      //             backgroundImage: MemoryImage(
                      //                 base64.decode(getBase64(imageTestingBase64))),
                      //           ),
                      //     Positioned(
                      //       bottom: 17,
                      //       right: 3,
                      //       child: InkWell(
                      //         onTap: () {
                      //           // if (state.userPhotos != null) {
                      //           //   showCustomConfirmationDialogue(
                      //           //       context: context,
                      //           //       title: 'Remove profile image ?',
                      //           //       buttonText: 'Remove',
                      //           //       onTap: () {
                      //           //         context
                      //           //             .read<UserDataBloc>()
                      //           //             .add(UserDataEvent.removeUserPhoto());
                      //           //       });
                      //           // } else {
                      //           //   cameraAndGalleryPickImage(
                      //           //       context: context,
                      //           //       onPressCam: () {
                      //           //         context.read<UserDataBloc>().add(
                      //           //             UserDataEvent.pickUserPhotos(cam: true));
                      //           //       },
                      //           //       onPressGallery: () {
                      //           //         context.read<UserDataBloc>().add(
                      //           //             UserDataEvent.pickUserPhotos(cam: false));
                      //           //       });
                      //           // }
                      //         },
                      //         child: CircleAvatar(
                      //           radius: 13,
                      //           child: Icon(imageTestingBase64 != null
                      //               ? Icons.close
                      //               : Icons.add),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                              autocompleteItems:
                                  textExtractionController.extractedNames,
                            ),
                            // personal phone number
                            AutocompleteTextField(
                              validate: Validate.phone,
                              maxLength: 10,
                              label: 'Phone Number *',
                              controller: cardController.phoneController,
                              inputType: TextInputType.phone,
                              autocompleteItems:
                                  textExtractionController.extractedPhoneNumbers,
                            ),
                            // personal email
                            AutocompleteTextField(
                              validate: Validate.email,
                              label: 'Email *',
                              controller: cardController.emailController,
                              inputType: TextInputType.emailAddress,
                              autocompleteItems:
                                  textExtractionController.extractedEmails,
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
                              autocompleteItems:
                                  textExtractionController.extractedDesignation,
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
                          return SkipOrContinueButtons(
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
                              if (personalDataFirstFormKey.currentState!.validate()) {
                                cardController.createCard(context);
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
          ],
        ),
      ),
    );
  }
}
