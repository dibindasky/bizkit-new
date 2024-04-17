import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/application/presentation/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardViewRowWiceIcons extends StatelessWidget {
  const CardViewRowWiceIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //phone number botom sheet
            DetailSharingIconWidget(
              onTap: () {
                List<String> items = [];
                if (state.anotherCard != null &&
                    state.anotherCard!.businessDetails != null &&
                    state.anotherCard!.businessDetails!.mobileNumber != null) {
                  items.add(state.anotherCard!.businessDetails!.mobileNumber!);
                }
                if (state.anotherCard != null &&
                    state.anotherCard!.personalDetails != null &&
                    state.anotherCard!.personalDetails!.phoneNumber != null) {
                  items.add(state.anotherCard!.personalDetails!.phoneNumber!);
                }
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  isDismissible: true,
                  showDragHandle: true,
                  backgroundColor: kblack,
                  builder: (context) => PreviewScreenRowIconsModelSheet(
                    fromPreview: false,
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
                if (state.anotherCard != null &&
                    state.anotherCard!.businessDetails != null &&
                    state.anotherCard!.businessDetails!.email != null) {
                  items.add(state.anotherCard!.businessDetails!.email!);
                }
                if (state.anotherCard != null &&
                    state.anotherCard!.personalDetails != null &&
                    state.anotherCard!.personalDetails!.email != null) {
                  items.add(state.anotherCard!.personalDetails!.email!);
                }
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  isDismissible: true,
                  showDragHandle: true,
                  backgroundColor: kblack,
                  builder: (context) => PreviewScreenRowIconsModelSheet(
                    fromPreview: false,
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
                        children: state.anotherCard != null &&
                                state.anotherCard!.businessDetails != null &&
                                state.anotherCard!.businessDetails!
                                        .websiteLink !=
                                    null
                            ? [
                                Text(
                                  'Website Link',
                                  style: textHeadStyle1,
                                ),
                                adjustHieght(10),
                                Text(
                                  state.anotherCard?.businessDetails
                                          ?.websiteLink ??
                                      '',
                                ),
                                adjustHieght(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: neonShade)),
                                        onPressed: () async {
                                          if (state.anotherCard != null &&
                                              state.anotherCard!
                                                      .businessDetails !=
                                                  null &&
                                              state
                                                      .anotherCard!
                                                      .businessDetails!
                                                      .websiteLink !=
                                                  null) {
                                            await LaunchUrl.launchUrls(
                                                    url: state
                                                        .anotherCard!
                                                        .businessDetails!
                                                        .websiteLink!)
                                                .then((value) =>
                                                    Navigator.pop(context));
                                          }
                                        },
                                        icon: const Icon(
                                            Icons.open_in_browser_outlined),
                                        label: const Text(
                                          'View Website',
                                          style: TextStyle(color: neonShade),
                                        )),
                                    adjustWidth(10),
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: neonShade)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'cancel',
                                          style: TextStyle(color: neonShade),
                                        )),
                                  ],
                                )
                              ]
                            : [
                                adjustHieght(10),
                                Text(
                                  'Websie details not available',
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
              onTap: () => (state.anotherCard?.socialMedia ?? []).isEmpty &&
                      (state.anotherCard?.businessSocialMedia ?? []).isEmpty
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
                                  ]),
                            ),
                          ))
                  : showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      showDragHandle: true,
                      backgroundColor: kblack,
                      builder: (context) {
                        List personal = state.anotherCard?.socialMedia ?? [],
                            business =
                                state.anotherCard?.businessSocialMedia ?? [];
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: state.anotherCard?.businessDetails?.address ==
                                null
                            ? [
                                adjustHieght(10),
                                Text(
                                  'Location/Address not available',
                                  style: textHeadStyle1,
                                ),
                                adjustHieght(10)
                              ]
                            : [
                                Text(
                                  'Address',
                                  style: textHeadStyle1,
                                ),
                                adjustHieght(10),
                                Text(
                                  state.anotherCard?.businessDetails?.address ??
                                      '',
                                ),
                                adjustHieght(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: neonShade)),
                                        onPressed: () async {
                                          await LaunchUrl.launchMap(
                                                  address: state
                                                          .anotherCard
                                                          ?.businessDetails
                                                          ?.address ??
                                                      '',
                                                  context: context)
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        },
                                        icon: const Icon(
                                            Icons.location_on_outlined),
                                        label: const Text(
                                          'ViewMap',
                                          style: TextStyle(color: neonShade),
                                        )),
                                    adjustWidth(10),
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: neonShade)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'cancel',
                                          style: TextStyle(color: neonShade),
                                        )),
                                  ],
                                )
                              ],
                      ),
                    ),
                  ),
                );
              },
              image: gifLocation,
            ),
          ],
        );
      },
    );
  }
}
