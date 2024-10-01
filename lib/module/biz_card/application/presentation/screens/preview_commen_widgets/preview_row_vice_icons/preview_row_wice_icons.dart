import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/social_media_handle.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';

class PreviewRowWiceIcons extends StatelessWidget {
  const PreviewRowWiceIcons({super.key, required this.fromPreview});

  final bool fromPreview;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //phone number botom sheet
        DetailSharingIconWidget(
          onTap: () {
            List<String> items = [];
            // if (fromPreview) {
            //   if (userState.personalData?.phoneNumber != null) {
            //     items.add(userState.personalData!.phoneNumber!);
            //   }
            //   if (businessState.businessData?.mobileNumber !=
            //       null) {
            //     items
            //         .add(businessState.businessData!.mobileNumber!);
            //   }
            // } else {
            //   if (state.anotherCard != null &&
            //       state.anotherCard!.personalDetails != null &&
            //       state.anotherCard!.personalDetails!.phoneNumber !=
            //           null) {
            //     items.add(state
            //         .anotherCard!.personalDetails!.phoneNumber!);
            //   }
            //   if (state.anotherCard != null &&
            //       state.anotherCard!.businessDetails != null &&
            //       state.anotherCard!.businessDetails!
            //               .mobileNumber !=
            //           null &&
            //       state.anotherCard!.businessDetails!.mobileNumber!
            //           .isNotEmpty) {
            //     items.add(state
            //         .anotherCard!.businessDetails!.mobileNumber!);
            //   }
            // }
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isDismissible: true,
              showDragHandle: true,
              backgroundColor: kblack,
              builder: (context) => PreviewScreenRowIconsModelSheet(
                fromPreview: fromPreview,
                image: imagePhone,
                items: items,
              ),
            );
          },
          image: imagePhone,
        ),
        // email bottom sheet
        DetailSharingIconWidget(
          onTap: () {
            List<String> items = [];
            // if (fromPreview) {
            //   if (userState.personalData?.email != null) {
            //     items.add(userState.personalData!.email!);
            //   }
            //   if (businessState.businessData?.email != null) {
            //     items.add(businessState.businessData!.email!);
            //   }
            // } else {
            //   if (state.anotherCard != null &&
            //       state.anotherCard!.personalDetails != null &&
            //       state.anotherCard!.personalDetails!.email !=
            //           null) {
            //     items.add(
            //         state.anotherCard!.personalDetails!.email!);
            //   }
            //   if (state.anotherCard != null &&
            //       state.anotherCard!.businessDetails != null &&
            //       state.anotherCard!.businessDetails!.email !=
            //           null &&
            //       state.anotherCard!.businessDetails!.email!
            //           .isNotEmpty) {
            //     items.add(
            //         state.anotherCard!.businessDetails!.email!);
            //   }
            // }
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isDismissible: true,
              showDragHandle: true,
              backgroundColor: kblack,
              builder: (context) => PreviewScreenRowIconsModelSheet(
                fromPreview: fromPreview,
                image: imagePhone,
                items: items,
              ),
            );
          },
          image: gifMail,
        ),
        // website navigator
        DetailSharingIconWidget(
          onTap: () {
            // if (fromPreview &&
            //     businessState.businessData?.websiteLink != null) {
            //   LaunchUrl.launchUrls(
            //       url: businessState.businessData!.websiteLink!);
            // } else if (!fromPreview &&
            //     state.anotherCard != null &&
            //     state.anotherCard!.businessDetails != null &&
            //     state.anotherCard!.businessDetails!.websiteLink != null) {
            //   LaunchUrl.launchUrls(
            //       url: state.anotherCard!.businessDetails!.websiteLink!);
            // }
          },
          image: gifGlobe,
        ),
        // social media bottom sheet
        DetailSharingIconWidget(
          onTap: () => showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: true,
            showDragHandle: true,
            backgroundColor: kblack,
            builder: (context) {
              List<SocialMediaHandles> personal = [], business = [];
              // if (fromPreview) {
              //   // if (userState.personalData?.personalSocialMedia !=
              //   //     null) {
              //   //   personal =
              //   //       userState.personalData!.personalSocialMedia!;
              //   // }
              //   // if (businessState
              //   //         .businessData?.socialMediaHandles !=
              //   //     null) {
              //   //   business = businessState
              //   //       .businessData!.socialMediaHandles!;
              //   // }
              // } else {
              //   if (state.anotherCard != null &&
              //       state.anotherCard!.businessSocialMedia != null) {
              //     business = state.anotherCard!.businessSocialMedia!;
              //   }
              //   if (state.anotherCard != null &&
              //       state.anotherCard!.socialMedia != null) {
              //     personal = state.anotherCard!.socialMedia!;
              //   }
              // }
              return AccountsListsBottomSheet(
                personal: personal,
                business: business,
              );
            },
          ),
          image: imageSpinner,
        ),
        // location navigator
        DetailSharingIconWidget(
          onTap: () {
            LaunchUrl.launchMap(address: 'address', context: context);
          },
          image: gifLocation,
        ),
      ],
    );
  }
}
