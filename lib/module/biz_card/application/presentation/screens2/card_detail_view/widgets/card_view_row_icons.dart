import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/social_media_handle.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
          // Obx(() {
          //   if (cardController.personalDetails.value?.phone == null) {
          //     return kempty;
          //   }
          //   return DetailSharingIconWidget(
          //     onTap: () {
          //       List<String> phone = [];
          //       List<String> itemsHead = [];
          //       if (cardController.personalDetails.value != null &&
          //           cardController.personalDetails.value!.phone != null &&
          //           cardController.personalDetails.value!.phone!.isNotEmpty) {
          //         phone.addAll(cardController.personalDetails.value!.phone!);
          //         itemsHead.addAll(List.generate(
          //             cardController.personalDetails.value!.phone!.length,
          //             (index) => 'Personal'));
          //       }
          //       if (cardController.businessDetails.value != null &&
          //           cardController.businessDetails.value!.businessPhone !=
          //               null &&
          //           cardController
          //               .businessDetails.value!.businessPhone!.isNotEmpty) {
          //         phone.addAll(
          //             cardController.businessDetails.value!.businessPhone!);
          //         itemsHead.addAll(List.generate(
          //             cardController
          //                 .businessDetails.value!.businessPhone!.length,
          //             (index) => 'Business'));
          //       }
          //       if ((cardController.personalDetails.value != null &&
          //               cardController.personalDetails.value!.phone != null) ||
          //           (cardController.businessDetails.value != null &&
          //               cardController.businessDetails.value!.businessPhone !=
          //                   null)) {
          //         showModalBottomSheet(
          //           context: context,
          //           enableDrag: true,
          //           isDismissible: true,
          //           showDragHandle: true,
          //           backgroundColor: kblack,
          //           builder: (context) => PreviewScreenRowIconsModelSheet(
          //             fromPreview: false,
          //             image: gifPhone,
          //             items: phone,
          //             itemsHeading: itemsHead,
          //           ),
          //         );
          //       }
          //     },
          //     image: gifPhone,
          //   );
          // }),
          // // email bottom sheet
          // Obx(
          //   () {
          //     if (cardController.personalDetails.value!.email == null) {
          //       return const SizedBox();
          //     }
          //     return DetailSharingIconWidget(
          //       onTap: () {
          //         List<String> email = [];
          //         List<String> itemsHead = [];
          //         if (cardController.personalDetails.value != null &&
          //             cardController.personalDetails.value!.email != null) {
          //           email.add(cardController.personalDetails.value!.email!);
          //           itemsHead.add('Personal Email');
          //         }
          //         if (cardController.businessDetails.value != null &&
          //             cardController.businessDetails.value!.businessEmail !=
          //                 null) {
          //           email.add(
          //               cardController.businessDetails.value!.businessEmail!);
          //           itemsHead.add('Business Email');
          //         }

          //         showModalBottomSheet(
          //           context: context,
          //           enableDrag: true,
          //           isDismissible: true,
          //           showDragHandle: true,
          //           backgroundColor: kblack,
          //           builder: (context) => PreviewScreenRowIconsModelSheet(
          //             fromPreview: false,
          //             image: gifPhone,
          //             items: email,
          //             itemsHeading: itemsHead,
          //           ),
          //         );
          //       },
          //       image: gifMail,
          //     );
          //   },
          // ),
          // // website navigator
          // DetailSharingIconWidget(
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) => Dialog(
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 20, horizontal: 20),
          //           decoration: BoxDecoration(
          //               border: Border.all(color: neonShade),
          //               borderRadius: BorderRadius.circular(10),
          //               color: backgroundColour),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children:
          //                 cardController.bizcardDetail.value.businessDetails !=
          //                             null &&
          //                         cardController.bizcardDetail.value
          //                                 .businessDetails?.websiteLink !=
          //                             null
          //                     ? [
          //                         Text('Website Link', style: textHeadStyle1),
          //                         adjustHieght(10),
          //                         // TextButton(
          //                         //   onPressed: () async {
          //                         //     await LaunchUrl.googleSearch(
          //                         //       url: cardController.bizcardDetail.value
          //                         //           .businessDetails!.websiteLink!,
          //                         //     ).then(
          //                         //       (value) => Navigator.pop(context),
          //                         //     );
          //                         //   },
          //                         //   child: Text(
          //                         //     cardController.bizcardDetail.value
          //                         //         .businessDetails!.websiteLink!,
          //                         //     style: const TextStyle(
          //                         //       color: kblue,
          //                         //       decorationColor: kblue,
          //                         //       decoration: TextDecoration.underline,
          //                         //     ),
          //                         //   ),
          //                         // ),
          //                         Text(
          //                           cardController.bizcardDetail.value
          //                               .businessDetails!.websiteLink!,
          //                         ),
          //                         adjustHieght(10),
          //                         FittedBox(
          //                           child: Row(
          //                             mainAxisAlignment: MainAxisAlignment.end,
          //                             children: [
          //                               OutlinedButton.icon(
          //                                 style: OutlinedButton.styleFrom(
          //                                     side: const BorderSide(
          //                                         color: neonShade)),
          //                                 onPressed: () async {
          //                                   await LaunchUrl.googleSearch(
          //                                     url: cardController
          //                                         .bizcardDetail
          //                                         .value
          //                                         .businessDetails!
          //                                         .websiteLink!,
          //                                   ).then(
          //                                     (value) => Navigator.pop(context),
          //                                   );
          //                                 },
          //                                 icon: const Icon(
          //                                     Icons.open_in_browser_outlined),
          //                                 label: const Text(
          //                                   'View Website',
          //                                   style: TextStyle(color: neonShade),
          //                                 ),
          //                               ),
          //                               adjustWidth(10),
          //                               OutlinedButton(
          //                                 style: OutlinedButton.styleFrom(
          //                                     side: const BorderSide(
          //                                         color: neonShade)),
          //                                 onPressed: () {
          //                                   Navigator.pop(context);
          //                                 },
          //                                 child: const Text(
          //                                   'Cancel',
          //                                   style: TextStyle(color: neonShade),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ]
          //                     : [
          //                         adjustHieght(10),
          //                         Text(
          //                           'Website details not available',
          //                           style: textHeadStyle1,
          //                         ),
          //                         adjustHieght(10)
          //                       ],
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          //   image: gifGlobe,
          // ),
          // // social media bottom sheet
          // DetailSharingIconWidget(
          //   onTap: () =>
          //       (cardController.personalDetails.value?.personalSocialMedia ??
          //                       [])
          //                   .isEmpty &&
          //               (cardController.businessDetails.value
          //                           ?.businessSocialMedia ??
          //                       [])
          //                   .isEmpty
          //           ? showDialog(
          //               context: context,
          //               builder: (context) => Dialog(
          //                 child: Container(
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 20, horizontal: 20),
          //                   decoration: BoxDecoration(
          //                       border: Border.all(color: neonShade),
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: backgroundColour),
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       adjustHieght(10),
          //                       Text(
          //                         'No social medias available',
          //                         style: textHeadStyle1,
          //                       ),
          //                       adjustHieght(10)
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             )
          //           : showModalBottomSheet(
          //               context: context,
          //               enableDrag: true,
          //               isDismissible: true,
          //               showDragHandle: true,
          //               backgroundColor: kblack,
          //               builder: (context) {
          //                 List<SocialMediaHandles> personal = cardController
          //                             .personalDetails
          //                             .value
          //                             ?.personalSocialMedia ??
          //                         [],
          //                     business = cardController.businessDetails.value
          //                             ?.businessSocialMedia ??
          //                         [];
          //                 return AccountsListsBottomSheet(
          //                   personal: personal,
          //                   business: business,
          //                 );
          //               },
          //             ),
          //   image: gifSpinner,
          // ),
          // // location navigator
          // DetailSharingIconWidget(
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) => Dialog(
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 20, horizontal: 20),
          //           decoration: BoxDecoration(
          //               border: Border.all(color: neonShade),
          //               borderRadius: BorderRadius.circular(10),
          //               color: backgroundColour),
          //           child: cardController.businessDetails.value == null &&
          //                   (cardController
          //                               .businessDetails.value?.branchOffices ==
          //                           null ||
          //                       cardController.businessDetails.value
          //                               ?.branchOffices?.length ==
          //                           0)
          //               ? Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     adjustHieght(10),
          //                     Text(
          //                       'Location/Address not available',
          //                       style: textHeadStyle1,
          //                     ),
          //                     adjustHieght(10)
          //                   ],
          //                 )
          //               : SingleChildScrollView(
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       cardController.businessDetails.value
          //                                   ?.branchOffices?.length ==
          //                               0
          //                           ? const SizedBox()
          //                           : const Text('Branch Office Address'),
          //                       cardController.businessDetails.value
          //                                       ?.branchOffices ==
          //                                   null ||
          //                               cardController.businessDetails.value
          //                                       ?.branchOffices ==
          //                                   <BranchOffice>[]
          //                           ? const SizedBox()
          //                           : ListView.builder(
          //                               physics:
          //                                   const NeverScrollableScrollPhysics(),
          //                               itemCount: cardController
          //                                       .businessDetails
          //                                       .value
          //                                       ?.branchOffices
          //                                       ?.length ??
          //                                   0,
          //                               shrinkWrap: true,
          //                               itemBuilder: (context, index) {
          //                                 final data = cardController
          //                                     .businessDetails
          //                                     .value
          //                                     ?.branchOffices![index];
          //                                 return AddressTilePopUp(
          //                                     location:
          //                                         data?.branchLocation ?? '',
          //                                     address:
          //                                         data?.branchAddress ?? '',
          //                                     contactPerson:
          //                                         data?.branchContactPerson ??
          //                                             '',
          //                                     phone:
          //                                         data?.branchContactNumber ??
          //                                             '');
          //                               },
          //                             )
          //                     ],
          //                   ),
          //                 ),
          //         ),
          //       ),
          //     );
          //   },
          //   image: gifLocation,
          // ),
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
