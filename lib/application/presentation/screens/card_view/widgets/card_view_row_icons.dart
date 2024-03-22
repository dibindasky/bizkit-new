import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
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
                if (state.anotherCard != null &&
                    state.anotherCard!.businessDetails != null &&
                    state.anotherCard!.businessDetails!.websiteLink != null) {
                  LaunchUrl.launchUrls(
                      url: state.anotherCard!.businessDetails!.websiteLink!);
                }
              },
              image: gifGlobe,
            ),
// social media bottom sheet
            DetailSharingIconWidget(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  List personal = [], business = [];
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
              onTap: () {},
              image: gifLocation,
            ),
          ],
        );
      },
    );
  }
}
