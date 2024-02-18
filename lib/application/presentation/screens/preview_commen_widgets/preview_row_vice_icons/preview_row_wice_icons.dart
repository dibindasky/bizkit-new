import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_vice_accounts_bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/application/presentation/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewRowWiceIcons extends StatelessWidget {
  const PreviewRowWiceIcons({super.key, required this.fromPreview});

  final bool fromPreview;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        return BlocBuilder<BusinessDataBloc, BusinessDataState>(
          builder: (context, businessState) {
            return BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, userState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //phone number botom sheet
                    DetailSharingIconWidget(
                      onTap: () {
                        List<String> items = [];
                        if (fromPreview) {
                          if (userState.personalDetails.phoneNumber != null) {
                            items.add(userState.personalDetails.phoneNumber!);
                          }
                          if (businessState.businessDetails.mobileNumber !=
                              null) {
                            items.addAll(businessState
                                .businessDetails.mobileNumber!
                                .map((e) => e.mobileNumber!)
                                .toList());
                          }
                        } else {
                          if (state.anotherCard != null &&
                              state.anotherCard!.personalDetails != null &&
                              state.anotherCard!.personalDetails!.phoneNumber !=
                                  null) {
                            items.add(state
                                .anotherCard!.personalDetails!.phoneNumber!);
                          }
                          if (state.anotherCard != null &&
                              state.anotherCard!.businessDetails != null &&
                              state.anotherCard!.businessDetails!
                                      .mobileNumber !=
                                  null &&
                              state.anotherCard!.businessDetails!.mobileNumber!
                                  .isNotEmpty) {
                            items.addAll(state
                                .anotherCard!.businessDetails!.mobileNumber!
                                .map((e) => e.mobileNumber!)
                                .toList());
                          }
                        }
                        showModalBottomSheet(
                          context: context,
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
                        if (fromPreview) {
                          if (userState.personalDetails.email != null) {
                            items.add(userState.personalDetails.email!);
                          }
                          if (businessState.businessDetails.email != null) {
                            items.addAll(businessState.businessDetails.email!
                                .map((e) => e.email!)
                                .toList());
                          }
                        } else {
                          if (state.anotherCard != null &&
                              state.anotherCard!.personalDetails != null &&
                              state.anotherCard!.personalDetails!.email !=
                                  null) {
                            items.add(
                                state.anotherCard!.personalDetails!.email!);
                          }
                          if (state.anotherCard != null &&
                              state.anotherCard!.businessDetails != null &&
                              state.anotherCard!.businessDetails!.email !=
                                  null &&
                              state.anotherCard!.businessDetails!.email!
                                  .isNotEmpty) {
                            items.addAll(state
                                .anotherCard!.businessDetails!.email!
                                .map((e) => e.email!)
                                .toList());
                          }
                        }
                        showModalBottomSheet(
                          context: context,
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
                        if (fromPreview &&
                            businessState.businessDetails.websiteLink != null) {
                          LaunchUrl.launchUrls(
                              url: businessState.businessDetails.websiteLink!);
                        } else if (!fromPreview &&
                            state.anotherCard != null &&
                            state.anotherCard!.businessDetails != null &&
                            state.anotherCard!.businessDetails!.websiteLink !=
                                null) {
                          LaunchUrl.launchUrls(
                              url: state
                                  .anotherCard!.businessDetails!.websiteLink!);
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
                          if (fromPreview) {
                            if (userState.personalDetails.personalSocialMedia !=
                                null) {
                              personal = userState
                                  .personalDetails.personalSocialMedia!;
                            }
                            if (businessState
                                    .businessDetails.socialMediaHandles !=
                                null) {
                              business = businessState
                                  .businessDetails.socialMediaHandles!;
                            }
                          } else {
                            if (state.anotherCard != null &&
                                state.anotherCard!.businessDetails != null &&
                                state.anotherCard!.businessDetails!
                                        .socialMediaHandles !=
                                    null) {
                              business = state.anotherCard!.businessDetails!
                                  .socialMediaHandles!;
                            }
                            if (state.anotherCard != null &&
                                state.anotherCard!.personalDetails != null &&
                                state.anotherCard!.personalDetails!
                                        .personalSocialMedia !=
                                    null) {
                              personal = state.anotherCard!.personalDetails!
                                  .personalSocialMedia!;
                            }
                          }
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
          },
        );
      },
    );
  }
}
