import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/email_or_phone_list_bottomlist.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/location_barach_bizcard_pop_up.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/social_media_accounts_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/website_list_bizcard.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/detail_row_icontext.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/detail_sharing_icon_image.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/social_media_handle.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardDetailsIconsWidgets extends StatelessWidget {
  const BizCardDetailsIconsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Obx(() => cardController.isLoading.value
          // loader
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  5,
                  (index) => ShimmerLoaderTile(
                    height: 45.h,
                    width: 45.h,
                  ),
                ),
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => ShimmerLoaderTile(
                    height: 35.h,
                    width: 80.h,
                  ),
                ),
              )
            ],
          )
        : Column(
            children: [
              FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    gifListCardDetail.length,
                    (index) => DetailSharingIconBizcardDetail(
                        image: gifListCardDetail[index],
                        onTap: () {
                          gifListCardDetailOnTap(context, index);
                        }),
                  ),
                ),
              ),
              kHeight20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    iconBizcardDetailsText.length,
                    (index) => DeatailRowIconTextBizcardDetail(
                        text: iconBizcardDetailsText[index],
                        image: iconBizcardDetails[index],
                        onTap: () {
                          iconsBizcardDeailsOnTap(context, index);
                        }),
                  ),
                ),
              ),
            ],
          ));
  }

  void iconsBizcardDeailsOnTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context)
            .pushNamed(Routes.cardBankingOrPersonalDetail, extra: true);
      case 1:
        GoRouter.of(context)
            .pushNamed(Routes.cardBankingOrPersonalDetail, extra: false);
      case 2:
        GoRouter.of(context).pushNamed(Routes.cardAchivements);
        break;
      default:
    }
  }

  void gifListCardDetailOnTap(BuildContext context, int index) {
    final cardController = Get.find<CardController>();
    switch (index) {
      case 0:
        List<String> phone = [];
        List<String> itemsHead = [];
        if (cardController.bizcardDetail.value.personalDetails != null &&
            cardController.bizcardDetail.value.personalDetails!.phone != null &&
            cardController.bizcardDetail.value.personalDetails!.phone!.isNotEmpty) {
          phone.addAll(cardController.bizcardDetail.value.personalDetails!.phone!);
          itemsHead.addAll(List.generate(
              cardController.bizcardDetail.value.personalDetails!.phone!.length,
              (index) => 'Personal'));
        }
        if (cardController.bizcardDetail.value.businessDetails != null &&
            cardController.bizcardDetail.value.businessDetails!.businessPhone != null &&
            cardController.bizcardDetail.value.businessDetails!.businessPhone!.isNotEmpty) {
          phone.addAll(cardController.bizcardDetail.value.businessDetails!.businessPhone!);
          itemsHead.addAll(List.generate(
              cardController.bizcardDetail.value.businessDetails!.businessPhone!.length,
              (index) => 'Business'));
        }
        if ((cardController.bizcardDetail.value.personalDetails != null &&
                cardController.bizcardDetail.value.personalDetails!.phone != null) ||
            (cardController.bizcardDetail.value.businessDetails != null &&
                cardController.bizcardDetail.value.businessDetails!.businessPhone != null)) {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: true,
            showDragHandle: true,
            builder: (context) => PreviewScreenRowIconsModelSheet(
              fromPreview: false,
              image: gifPhone,
              items: phone,
              itemsHeading: itemsHead,
            ),
          );
        }

        break;
      case 1:
        List<String> email = [];
        List<String> itemsHead = [];
        if (cardController.bizcardDetail.value.personalDetails != null &&
            cardController.bizcardDetail.value.personalDetails!.email != null) {
          email.add(cardController.bizcardDetail.value.personalDetails!.email!);
          itemsHead.add('Personal Email');
        }
        if (cardController.bizcardDetail.value.businessDetails != null &&
            cardController.bizcardDetail.value.businessDetails!.businessEmail != null) {
          email.add(cardController.bizcardDetail.value.businessDetails!.businessEmail!);
          itemsHead.add('Business Email');
        }

        showModalBottomSheet(
          context: context,
          enableDrag: true,
          isDismissible: true,
          showDragHandle: true,
          builder: (context) => PreviewScreenRowIconsModelSheet(
            fromPreview: false,
            image: gifPhone,
            items: email,
            itemsHeading: itemsHead,
          ),
        );
      case 2:
        showDialog(
          context: context,
          builder: (context) => const Dialog(
            child: BizcardDeatilWebsiteDialoge(),
          ),
        );
      case 3:
        (cardController.bizcardDetail.value.personalDetails?.personalSocialMedia ?? [])
                    .isEmpty &&
                (cardController.bizcardDetail.value.businessDetails?.businessSocialMedia ??
                        [])
                    .isEmpty
            ? showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kHeight10,
                        Icon(Icons.mobile_off_rounded,
                            color: Theme.of(context).colorScheme.onPrimary),
                        kHeight10,
                        Text(
                          'No social medias available',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        kHeight10
                      ],
                    ),
                  ),
                ),
              )
            : showModalBottomSheet(
                context: context,
                enableDrag: true,
                isDismissible: true,
                showDragHandle: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  List<SocialMediaHandles> personal = cardController.bizcardDetail.value
                              .personalDetails?.personalSocialMedia ??
                          [],
                      business = cardController
                              .bizcardDetail.value.businessDetails?.businessSocialMedia ??
                          [];
                  return SocialMediaAccountsListsBottomSheet(
                    personal: personal,
                    business: business,
                  );
                },
              );
      case 4:
        showDialog(
          context: context,
          builder: (context) => const Dialog(
            child: BizcardDetailLocationListBranchSheet(),
          ),
        );
      default:
    }
  }
}
