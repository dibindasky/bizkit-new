import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/personal_info/card_detail_update_personal_info.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                kHeight30,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: selectedCategory == 'Select your account'
                        ? null
                        : Border.all(
                            color: Theme.of(context).colorScheme.secondary),
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
                              Text(socialMedias[index],
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                              const Spacer(),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: kwhite,
                                backgroundImage: AssetImage(
                                    socialMediaImage[socialMedias[index]]!),
                              ),
                              kWidth30,
                            ],
                          ),
                        ),
                      ),
                      hint: Text(
                        selectedCategory,
                        style: selectedCategory == 'Social Media'
                            ? Theme.of(context).textTheme.displaySmall
                            : Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
                kHeight20,
                kHeight30,
              ],
            ),
          )
        ]),
      )),
    );
  }
}
