import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/personal_info/card_detail_update_personal_info.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardSocialMediaCreateUpdateScreen extends StatefulWidget {
  const BizCardSocialMediaCreateUpdateScreen(
      {super.key, required this.fromBusiness});

  final bool fromBusiness;

  @override
  State<BizCardSocialMediaCreateUpdateScreen> createState() =>
      _BizCardSocialMediaCreateUpdateScreenState();
}

class _BizCardSocialMediaCreateUpdateScreenState
    extends State<BizCardSocialMediaCreateUpdateScreen> {
  TextEditingController linkController = TextEditingController(),
      accountController = TextEditingController();

  String selectedCategory = 'Social Media';
  List<String> socialMedias = socialMedia;
  @override
  Widget build(BuildContext context) {
    final personalController = Get.find<PersonalDetailsController>();
    final cardController = Get.find<CardController>();
    final businessController = Get.find<BusinesDetailsController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            kHeight10,
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
                Text('Social Media Handle',
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    kHeight40,
                    AutocompleteTextField(
                      label: 'Select your account',
                      controller: accountController,
                      textCapitalization: TextCapitalization.words,
                      showDropdownOnTap: true,
                      autocompleteItems: socialMedias,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                      onDropDownSelection: (value) {
                        setState(() {
                          selectedCategory = value;
                          accountController.text = value;
                        });
                      },
                    ),
                    kHeight5,
                    CustomTextFormField(
                      inputFormatters: selectedCategory == 'Whatsapp' ||
                              selectedCategory == 'Telegram'
                          ? [FilteringTextInputFormatter.digitsOnly]
                          : [],
                      maxlegth: selectedCategory == 'Whatsapp' ||
                              selectedCategory == 'Telegram'
                          ? 10
                          : null,
                      controller: linkController,
                      labelText: selectedCategory == 'Whatsapp'
                          ? 'Enter Whatsap Number'
                          : selectedCategory == 'Telegram'
                              ? 'Enter Telegram Number'
                              : 'Paste Account Link here',
                      inputType: selectedCategory == 'Whatsapp' ||
                              selectedCategory == 'Telegram'
                          ? TextInputType.number
                          : TextInputType.url,
                    ),
                    kHeight15,
                    Obx(
                      () {
                        if (!widget.fromBusiness &&
                            personalController.isLoading.value) {
                          return const LoadingAnimation();
                        } else if (widget.fromBusiness &&
                            businessController.socialMediaLoading.value) {
                          return const LoadingAnimation();
                        }
                        return EventButton(
                          text: 'Add',
                          showGradiant: false,
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (selectedCategory == 'Social Media') {
                              showSnackbar(context,
                                  message: 'Select social media first',
                                  textColor: kwhite,
                                  backgroundColor: kred);
                              return;
                            }
                            if (linkController.text == '') {
                              if (selectedCategory == 'Whatsapp' ||
                                  selectedCategory == 'Telegram') {
                                showSnackbar(context,
                                    message: 'Add your social media Number',
                                    textColor: kwhite,
                                    backgroundColor: kred);
                                return;
                              } else {
                                showSnackbar(context,
                                    message: 'Add your social media link',
                                    textColor: kwhite,
                                    backgroundColor: kred);
                                return;
                              }
                            }
                            final link = selectedCategory == 'Whatsapp'
                                ? 'https://wa.me/${linkController.text}'
                                : selectedCategory == 'Telegram'
                                    ? 'https://t.me/+${linkController.text}'
                                    : linkController.text;
                            PersonalSocialMediaRequestModel
                                personalSocialMediaModel =
                                PersonalSocialMediaRequestModel(
                                    label: selectedCategory,
                                    link: link,
                                    bizcardId: cardController
                                        .bizcardDetail.value.bizcardId,
                                    personalDetailsId: !widget.fromBusiness
                                        ? cardController.bizcardDetail.value
                                            .personalDetails?.id
                                        : cardController.bizcardDetail.value
                                            .businessDetails?.id);
                            !widget.fromBusiness
                                ? personalController.personalSocialMediaAdding(
                                    context: context,
                                    personalSocialMediaModel:
                                        personalSocialMediaModel)
                                : businessController.socialMediaAdding(
                                    context: context,
                                    lebel: selectedCategory,
                                    link: link);
                            linkController.text = '';
                            selectedCategory = 'Social Media';
                            setState(() {});
                          },
                        );
                      },
                    ),
                    kHeight30,
                    Wrap(
                      children: List.generate(
                        !widget.fromBusiness
                            ? (cardController
                                    .bizcardDetail
                                    .value
                                    .personalDetails
                                    ?.personalSocialMedia
                                    ?.length ??
                                0)
                            : (cardController
                                    .bizcardDetail
                                    .value
                                    .businessDetails
                                    ?.businessSocialMedia
                                    ?.length ??
                                0),
                        (index) {
                          final data = (!widget.fromBusiness)
                              ? (cardController.bizcardDetail.value
                                  .personalDetails?.personalSocialMedia?[index])
                              : cardController.bizcardDetail.value
                                  .businessDetails?.businessSocialMedia?[index];
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDailoges(context,
                                      heading: 'Social Media',
                                      tittle: data?.label ?? '',
                                      desc: data?.link ?? '');
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: kBorderRadius10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                          radius: 10,
                                          child: Icon(Icons.link, size: 10.h)),
                                      kWidth10,
                                      Text(
                                          widget.fromBusiness
                                              ? (cardController
                                                      .bizcardDetail
                                                      .value
                                                      .businessDetails
                                                      ?.businessSocialMedia?[
                                                          index]
                                                      .label ??
                                                  '')
                                              : cardController
                                                      .bizcardDetail
                                                      .value
                                                      .personalDetails
                                                      ?.personalSocialMedia?[
                                                          index]
                                                      .label ??
                                                  '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    showCustomConfirmationDialogue(
                                        context: context,
                                        title:
                                            'Are You Sure Do You Want To Delete?',
                                        buttonText: 'Delete',
                                        onTap: () {
                                          !widget.fromBusiness
                                              ? personalController
                                                  .personalSocialMediaDelete(
                                                      context: context, index)
                                              : businessController
                                                  .socialMediaDelete(
                                                      index: index,
                                                      context: context);
                                        });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const ColoredBox(
                                      color: neonShade,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.close, size: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
