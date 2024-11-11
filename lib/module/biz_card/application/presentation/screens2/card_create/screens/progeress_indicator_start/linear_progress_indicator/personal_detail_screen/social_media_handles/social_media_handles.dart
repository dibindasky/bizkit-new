import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/personal_detail_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialMediahandlesScreen extends StatefulWidget {
  const SocialMediahandlesScreen({super.key, required this.fromBusiness});

  final bool fromBusiness;
  // final int cardId;

  @override
  State<SocialMediahandlesScreen> createState() =>
      _SocialMediahandlesScreenState();
}

class _SocialMediahandlesScreenState extends State<SocialMediahandlesScreen> {
  TextEditingController linkController = TextEditingController();
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 17),
          ),
          backgroundColor: knill,
          title: Text('Social media accounts', style: textHeadStyle1),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       icon: const Icon(Icons.check)),
          //   adjustWidth(20)
          // ],
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  adjustHieght(40),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: selectedCategory == 'Select your account'
                          ? null
                          : Border.all(color: kwhite),
                    ),
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: List.generate(
                          socialMedias.length,
                          (index) => DropdownMenuItem(
                            value: socialMedias[index],
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: kwhite,
                                  backgroundImage: AssetImage(
                                      socialMediaImage[socialMedias[index]]!),
                                ),
                                adjustWidth(10),
                                Text(socialMedias[index]),
                              ],
                            ),
                          ),
                        ),
                        hint: Text(
                          selectedCategory,
                          style: selectedCategory == 'Social Media'
                              ? null
                              : textStyle1.copyWith(color: kwhite),
                        ),
                      ),
                    ),
                  ),
                  kHeight20,
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
                            : 'Account Link Paste here',
                    inputType: selectedCategory == 'Whatsapp' ||
                            selectedCategory == 'Telegram'
                        ? TextInputType.number
                        : TextInputType.url,
                  ),
                  kHeight30,
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
                          PersonalSocialMediaRequestModel personalSocialMediaModel =
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
                  adjustHieght(30),
                  Wrap(
                    children: List.generate(
                      !widget.fromBusiness
                          ? (cardController.bizcardDetail.value.personalDetails
                                  ?.personalSocialMedia?.length ??
                              0)
                          : (cardController.bizcardDetail.value.businessDetails
                                  ?.businessSocialMedia?.length ??
                              0),
                      (index) {
                        final data = (!widget.fromBusiness)
                            ? (cardController.bizcardDetail.value
                                .personalDetails?.personalSocialMedia?[index])
                            : cardController.bizcardDetail.value.businessDetails
                                ?.businessSocialMedia?[index];
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
                                    border: Border.all(color: neonShade),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                        radius: 10,
                                        child: Icon(Icons.account_box,
                                            size: 10.h)),
                                    kWidth10,
                                    Text(widget.fromBusiness
                                        ? (cardController
                                                .bizcardDetail
                                                .value
                                                .businessDetails
                                                ?.businessSocialMedia?[index]
                                                .label ??
                                            '')
                                        : cardController
                                                .bizcardDetail
                                                .value
                                                .personalDetails
                                                ?.personalSocialMedia?[index]
                                                .label ??
                                            ''),
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
          ),
        ),
      ),
    );
  }
}
