import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardViewRowWiceIcons extends StatelessWidget {
  const CardViewRowWiceIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // phone number botom sheet
          Obx(
            () {
              if (cardController.personalDetails.value?.phone == null) {
                return const SizedBox();
              }
              {
                return DetailSharingIconWidget(
                  onTap: () {
                    List<String> phone = [];
                    List<String> itemsHead = [];
                    if (cardController.personalDetails.value != null &&
                        cardController.personalDetails.value!.phone != null &&
                        cardController
                            .personalDetails.value!.phone!.isNotEmpty) {
                      phone = cardController.personalDetails.value!.phone!;
                      itemsHead.add('Personal');
                    }
                    // if (cardController.businessDetails.value != null &&
                    //     cardController.businessDetails.value. != null &&
                    //     state.anotherCard!.businessDetails!.mobileNumber !=
                    //         null) {
                    //   items
                    //       .add(state.anotherCard!.businessDetails!.mobileNumber!);
                    //   itemsHead.add('Business');
                    // }
                    if (cardController.personalDetails.value != null &&
                        cardController.personalDetails.value!.phone != null) {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        isDismissible: true,
                        showDragHandle: true,
                        backgroundColor: kblack,
                        builder: (context) => PreviewScreenRowIconsModelSheet(
                          fromPreview: false,
                          image: imagePhone,
                          items: phone,
                          itemsHeading: itemsHead,
                        ),
                      );
                    }
                  },
                  image: imagePhone,
                );
              }
            },
          ),
          // email bottom sheet
          Obx(
            () {
              if (cardController.personalDetails.value!.email == null) {
                return const SizedBox();
              }
              return DetailSharingIconWidget(
                onTap: () {
                  String email = '';
                  List<String> itemsHead = [];
                  if (cardController.personalDetails.value != null &&
                      cardController.personalDetails.value!.email != null) {
                    email = cardController.personalDetails.value!.email!;
                    itemsHead.add('Email');
                  }
                  // if (state.anotherCard != null &&
                  //     state.anotherCard!.businessDetails != null &&
                  //     state.anotherCard!.businessDetails!.email != null) {
                  //   items.add(state.anotherCard!.businessDetails!.email!);
                  //   itemsHead.add('Business');
                  // }
                  // if (state.anotherCard != null &&
                  //     state.anotherCard!.personalDetails != null &&
                  //     state.anotherCard!.personalDetails!.email != null) {
                  // }
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    showDragHandle: true,
                    backgroundColor: kblack,
                    builder: (context) => PreviewScreenRowIconsModelSheet(
                      fromPreview: false,
                      image: imagePhone,
                      items: [email],
                      itemsHeading: itemsHead,
                    ),
                  );
                },
                image: gifMail,
              );
            },
          ),
          // website navigator
          DetailSharingIconWidget(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundColour),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          //         state.anotherCard!.businessDetails != null &&
                          //         state.anotherCard!.businessDetails!
                          //                 .websiteLink !=
                          //             null
                          //     ? [
                          //         Text('Website Link', style: textHeadStyle1),
                          //         adjustHieght(10),
                          //         TextButton(
                          //           onPressed: () async {
                          //             if (state.anotherCard != null &&
                          //                 state.anotherCard!.businessDetails !=
                          //                     null &&
                          //                 state.anotherCard!.businessDetails!
                          //                         .websiteLink !=
                          //                     null) {
                          //               await LaunchUrl.googleSearch(
                          //                 url: state.anotherCard!
                          //                     .businessDetails!.websiteLink!,
                          //               ).then(
                          //                 (value) => Navigator.pop(context),
                          //               );
                          //             }
                          //           },
                          //           child: Text(
                          //             '${state.anotherCard?.businessDetails?.websiteLink}',
                          //             style: const TextStyle(
                          //               color: kblue,
                          //               decorationColor: kblue,
                          //               decoration: TextDecoration.underline,
                          //             ),
                          //           ),
                          //         ),
                          //         // Text(
                          //         //   state.anotherCard?.businessDetails
                          //         //           ?.websiteLink ??
                          //         //       '',
                          //         // ),
                          //         adjustHieght(10),
                          //         FittedBox(
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             children: [
                          //               OutlinedButton.icon(
                          //                 style: OutlinedButton.styleFrom(
                          //                     side: const BorderSide(
                          //                         color: neonShade)),
                          //                 onPressed: () async {
                          //                   if (state.anotherCard != null &&
                          //                       state.anotherCard!
                          //                               .businessDetails !=
                          //                           null &&
                          //                       state
                          //                               .anotherCard!
                          //                               .businessDetails!
                          //                               .websiteLink !=
                          //                           null) {
                          //                     await LaunchUrl.googleSearch(
                          //                       url: state
                          //                           .anotherCard!
                          //                           .businessDetails!
                          //                           .websiteLink!,
                          //                     ).then(
                          //                       (value) =>
                          //                           Navigator.pop(context),
                          //                     );
                          //                   }
                          //                 },
                          //                 icon: const Icon(
                          //                     Icons.open_in_browser_outlined),
                          //                 label: const Text(
                          //                   'View Website',
                          //                   style: TextStyle(color: neonShade),
                          //                 ),
                          //               ),
                          //               adjustWidth(10),
                          //               OutlinedButton(
                          //                 style: OutlinedButton.styleFrom(
                          //                     side: const BorderSide(
                          //                         color: neonShade)),
                          //                 onPressed: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //                 child: const Text(
                          //                   'Cancel',
                          //                   style: TextStyle(color: neonShade),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         )
                          //       ]
                          //     :
                          [
                        adjustHieght(10),
                        Text(
                          'Website details not available',
                          style: textHeadStyle1,
                        ),
                        adjustHieght(10)
                      ],
                    ),
                  ),
                ),
              );
            },
            image: gifGlobe,
          ),
          // social media bottom sheet
          DetailSharingIconWidget(
            onTap: () =>
                (cardController.personalDetails.value?.personalSocialMedia ??
                                [])
                            .isEmpty &&
                        (cardController.businessDetails.value
                                    ?.businessSocialMedia ??
                                [])
                            .isEmpty
                    ? showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: neonShade),
                                borderRadius: BorderRadius.circular(10),
                                color: backgroundColour),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                adjustHieght(10),
                                Text(
                                  'No social medias available',
                                  style: textHeadStyle1,
                                ),
                                adjustHieght(10)
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
                        backgroundColor: kblack,
                        builder: (context) {
                          List personal = cardController.personalDetails.value
                                      ?.personalSocialMedia ??
                                  [],
                              business = cardController.businessDetails.value
                                      ?.businessSocialMedia ??
                                  [];
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
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundColour),
                    child: cardController.businessDetails.value == null &&
                            (cardController
                                        .businessDetails.value?.branchOffices ==
                                    null ||
                                cardController.businessDetails.value
                                        ?.branchOffices?.length ==
                                    0)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              adjustHieght(10),
                              Text(
                                'Location/Address not available',
                                style: textHeadStyle1,
                              ),
                              adjustHieght(10)
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                cardController.businessDetails.value
                                            ?.branchOffices?.length ==
                                        0
                                    ? const SizedBox()
                                    : const Text('Branch Office Address'),
                                cardController.businessDetails.value
                                                ?.branchOffices ==
                                            null ||
                                        cardController.businessDetails.value
                                                ?.branchOffices ==
                                            <BranchOffice>[]
                                    ? const SizedBox()
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: cardController
                                                .businessDetails
                                                .value
                                                ?.branchOffices
                                                ?.length ??
                                            0,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final data = cardController
                                              .businessDetails
                                              .value
                                              ?.branchOffices![index];
                                          return AddressTilePopUp(
                                              location:
                                                  data?.branchLocation ?? '',
                                              address:
                                                  data?.branchAddress ?? '',
                                              contactPerson:
                                                  data?.branchContactPerson ??
                                                      '',
                                              phone:
                                                  data?.branchContactNumber ??
                                                      '');
                                        },
                                      )
                              ],
                            ),
                          ),
                  ),
                ),
              );
            },
            image: gifLocation,
          ),
        ],
      ),
    );
  }
}

// Address popup tile
class AddressTilePopUp extends StatelessWidget {
  const AddressTilePopUp({
    super.key,
    this.address,
    this.phone,
    this.contactPerson,
    this.location,
  });
  final String? location;
  final String? address;
  final String? phone;
  final String? contactPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: neonShade),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColour),
      child: Column(
        children: [
          Text(location ?? ''),
          Text(address ?? ''),
          adjustHieght(10),
          contactPerson == null || contactPerson == ''
              ? const SizedBox()
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Name : ${contactPerson ?? ''}')),
          phone == null || phone == ''
              ? kempty
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Contact : ${phone ?? ''}')),
          kHeight5,
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                phone == null || phone == ''
                    ? const SizedBox()
                    : OutlinedButton.icon(
                        onPressed: () {
                          LaunchUrl.launchCall(phone: phone ?? "");
                        },
                        icon: const Icon(Icons.phone_forwarded_outlined,
                            color: neonShade),
                        label: const Text('Call')),
                const SizedBox(width: 20),
                address == null || address == ''
                    ? const SizedBox()
                    : OutlinedButton.icon(
                        onPressed: () async {
                          await LaunchUrl.launchMap(
                                  address: address ?? '', context: context)
                              .then((value) => Navigator.pop(context));
                        },
                        icon: const Icon(Icons.location_on_outlined,
                            color: neonShade),
                        label: const Text('View Map')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
