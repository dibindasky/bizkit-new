import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/email_or_phone_list_bottomlist.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/website_list_bizcard.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/received_card_detail/widgets/received_card_edit_page.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/packages/share/share_plus.dart';
import 'package:bizkit/utils/animations/pageview_animated_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

class ReceivedCardDetailScreen extends StatefulWidget {
  const ReceivedCardDetailScreen({super.key, this.visitingCardId});
  final String? visitingCardId;

  @override
  State<ReceivedCardDetailScreen> createState() =>
      _ReceivedCardDetailScreenState();
}

class _ReceivedCardDetailScreenState extends State<ReceivedCardDetailScreen> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  Future<void> sharePdfFromBase64(
      String pdfBase64String, String additionalData) async {
    // Decode base64 string to Uint8List
    Uint8List pdfData = base64Decode(pdfBase64String);

    // Save PDF data to a temporary file
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/bizkit_$additionalData.pdf');
    await tempFile.writeAsBytes(pdfData);

    // Share PDF file
    await Share.shareXFiles([XFile(tempFile.path)]);
  }

  @override
  Widget build(BuildContext context) {
    final visitingCardController = Get.find<ReceivedCardController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    adjustWidth(20.w),
                    Text(
                      'Received Card',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      position: PopupMenuPosition.under,
                      enabled: internetConnectinController
                          .isConnectedToInternet.value,
                      icon: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: klightgrey),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.more_vert,
                            size: 25,
                          ),
                        ),
                      ),
                      onSelected: (value) {},
                      itemBuilder: (context) {
                        List<PopupMenuEntry<String>> items = [];

                        items.addAll(
                          [
                            PopupMenuItem(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CardSecondUpdation()));
                                // GoRouter.of(context).pushNamed(Routes.receivedCardEdit);
                              },
                              value: 'Edit card',
                              child: const Text('Edit card'),
                            ),
                            PopupMenuItem(
                              onTap: () => showConfirmationDialog(
                                heading:
                                    'Are you sure you want to delete your visiting card',
                                context,
                                onPressed: () {
                                  visitingCardController.deleteVisitingCard(
                                      context: context,
                                      visitingCardDeleteModel:
                                          VisitingCardDeleteModel(
                                        cardId: visitingCardController
                                                .visitingCardDetails.value.id ??
                                            '',
                                        isDisabled: true,
                                      ));
                                },
                              ),
                              value: 'Delete card',
                              child: const Text('Delete card'),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                SharePlus.shareVisitingCardDetails(
                                    visitingCardController
                                        .visitingCardDetails.value);
                              },
                              value: 'Share card',
                              child: const Text('Share card'),
                            )
                          ],
                        );
                        return items;
                      },
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  if (visitingCardController.isLoading.value) {
                    return SizedBox(
                      height: khieght,
                      child: const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 3,
                      )),
                    );
                  } else if (visitingCardController.filterdVisitingCards ==
                      null) {
                    return GestureDetector(
                      onTap: () {
                        if (widget.visitingCardId != null) {
                          visitingCardController.fetchReceivedCardDetails(
                              receivedCardId: widget.visitingCardId ?? '');
                        }
                      },
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.refresh),
                            Text('Tap to retry'),
                          ],
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        visitingCardController.fetchReceivedCardDetails(
                            receivedCardId: widget.visitingCardId ?? '');
                      },
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: khieght,
                          child: Column(
                            children: [
                              adjustHieght(20),
                              // image carosal view
                              SizedBox(
                                  height: 200,
                                  child: PagviewAnimateBuilder(
                                      pageController: pageController,
                                      pageValue: pageValue,
                                      pageCount:
                                          visitingCardController.selfie.length,
                                      onpageCallBack: (index) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      child: (index, context) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              GoRouter.of(context).pushNamed(
                                                  Routes.slidablePhotoGallery,
                                                  extra: {
                                                    'images':
                                                        visitingCardController
                                                            .selfie,
                                                    'initial': index,
                                                    'memory': false,
                                                  });
                                            },
                                            child: NetworkImageWithLoader(
                                                radius: 25,
                                                visitingCardController
                                                    .selfie[index]),
                                          )))),
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    visitingCardController.visitingCardDetails
                                            .value.company ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    visitingCardController.visitingCardDetails
                                            .value.designation ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  adjustHieght(khieght * .02),
                                ],
                              ),
                              const CardViewRowWiceIcons(),
                              adjustHieght(khieght * .02),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: neonShade),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    adjustHieght(10),
                                    ItemsContainer(
                                      heading: 'Location',
                                      item: visitingCardController
                                              .visitingCardDetails
                                              .value
                                              .location ??
                                          'Location',
                                    ),
                                    ItemsContainer(
                                      heading: 'Occasion',
                                      item: visitingCardController
                                              .visitingCardDetails
                                              .value
                                              .occation ??
                                          'Occation',
                                    ),
                                    ItemsContainer(
                                      heading: 'Occupation',
                                      item: visitingCardController
                                              .visitingCardDetails
                                              .value
                                              .occupation ??
                                          'Occupation',
                                    ),
                                    ItemsContainer(
                                      heading: 'Designation',
                                      item: visitingCardController
                                              .visitingCardDetails
                                              .value
                                              .designation ??
                                          'Designation',
                                    ),
                                    ItemsContainer(
                                      heading: 'Notes',
                                      item: visitingCardController
                                              .visitingCardDetails
                                              .value
                                              .notes ??
                                          'Notes',
                                    ),
                                    // const ItemsContainer(
                                    //   heading: 'Date',
                                    //   item: 'Date',
                                    // ),
                                    // const ItemsContainer(
                                    //   heading: 'Time',
                                    //   item: 'Time',
                                    //   istime: false,
                                    // ),
                                    // adjustHieght(10),
                                  ],
                                ),
                              ),
                              adjustHieght(30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsContainer extends StatelessWidget {
  const ItemsContainer({
    super.key,
    required this.item,
    required this.heading,
    this.istime = true,
  });
  final String? item;
  final String heading;
  final bool istime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item != ''
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: kwidth * .24,
                        child: Text(
                          item != "" ? heading : '',
                          style: Theme.of(context).textTheme.displaySmall,
                        )),
                    const Text(':   ', style: TextStyle(color: neonShade)),
                    Expanded(
                      child: Text(
                        item ?? '',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              )
            : kempty,
        item != null && item != '' && istime
            ? const Divider(color: neonShade)
            : kempty
      ],
    );
  }
}

class CardViewRowWiceIcons extends StatelessWidget {
  const CardViewRowWiceIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final visitingCardController = Get.find<ReceivedCardController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //phone number botom sheet

        DetailSharingIconWidget(
          onTap: () {
            List<String> phone = [];
            // items.add(state.getSecondCardModel!.phoneNumber!);

            if (visitingCardController.visitingCardDetails.value.phoneNumber !=
                    null &&
                visitingCardController
                    .visitingCardDetails.value.phoneNumber!.isNotEmpty) {
              phone.add(visitingCardController
                      .visitingCardDetails.value.phoneNumber ??
                  '');
            }

            if (visitingCardController.visitingCardDetails.value != null &&
                visitingCardController.visitingCardDetails.value.phoneNumber !=
                    null) {
              showModalBottomSheet(
                  showDragHandle: true,
                  isDismissible: true,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return PreviewScreenRowIconsModelSheet(
                      fromPreview: false,
                      image: gifPhone,
                      items: [
                        visitingCardController
                                .visitingCardDetails.value.phoneNumber ??
                            ''
                      ],
                      itemsHeading: ['personal'],
                    );
                  });
            }
          },
          image: gifPhone,
        ),
        // email bottom sheet

        DetailSharingIconWidget(
          onTap: () {
            List<String> emails = [];
            if (visitingCardController.visitingCardDetails.value.email !=
                    null &&
                visitingCardController
                    .visitingCardDetails.value.email!.isNotEmpty) {
              emails.add(
                  visitingCardController.visitingCardDetails.value.email ?? '');
            }
            if (visitingCardController.visitingCardDetails.value != null &&
                visitingCardController.visitingCardDetails.value.email !=
                    null) {
              showModalBottomSheet(
                  showDragHandle: true,
                  isDismissible: true,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return PreviewScreenRowIconsModelSheet(
                      fromPreview: false,
                      image: gifPhone,
                      items: [
                        visitingCardController
                                .visitingCardDetails.value.email ??
                            ''
                      ],
                      itemsHeading: const ['personal'],
                    );
                  });
            }
          },
          image: gifMail,
        ),
        // website navigator
        DetailSharingIconWidget(
          onTap: () {
            String website = '';
            if (visitingCardController.visitingCardDetails.value.website !=
                    null &&
                visitingCardController
                    .visitingCardDetails.value.website!.isNotEmpty) {
              website =
                  visitingCardController.visitingCardDetails.value.website ??
                      '';
            }
            if (visitingCardController.visitingCardDetails.value != null &&
                visitingCardController.visitingCardDetails.value.website !=
                    null) {
              showDialog(
                context: context,
                builder: (context) {
                  // return Dialog(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 20),
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: neonShade),
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Theme.of(context).scaffoldBackgroundColor),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Text('Website',
                  //             style: Theme.of(context).textTheme.titleMedium),
                  //         adjustHieght(10),
                  //         TextButton(
                  //           onPressed: () async {
                  //             await LaunchUrl.googleSearch(
                  //               url: website,
                  //             ).then((value) => Navigator.pop(context));
                  //           },
                  //           child: Text(
                  //             website,
                  //             style: textStyle1.copyWith(
                  //               color: kblue,
                  //               decoration: TextDecoration.underline,
                  //               decorationColor: kblue,
                  //             ),
                  //           ),
                  //         ),
                  //         adjustHieght(10),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             OutlinedButton.icon(
                  //               style: OutlinedButton.styleFrom(
                  //                   side: const BorderSide(color: neonShade)),
                  //               onPressed: () async {
                  //                 await LaunchUrl.googleSearch(
                  //                   url: website,
                  //                 ).then((value) => Navigator.pop(context));
                  //               },
                  //               icon: const Icon(Icons.webhook_rounded),
                  //               label: const Text(
                  //                 'View site',
                  //                 style: TextStyle(color: neonShade),
                  //               ),
                  //             ),
                  //             adjustWidth(10),
                  //             OutlinedButton(
                  //               style: OutlinedButton.styleFrom(
                  //                   side: const BorderSide(color: neonShade)),
                  //               onPressed: () {
                  //                 Navigator.pop(context);
                  //               },
                  //               child: const Text(
                  //                 'Cancel',
                  //                 style: TextStyle(color: neonShade),
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // );

                  return Dialog(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: website != null
                          ? [
                              Text('Website Link',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              kHeight10,
                              Text(
                                website,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontSize: 13.sp,
                                    ),
                              ),
                              kHeight10,
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)),
                                      onPressed: () async {
                                        await LaunchUrl.googleSearch(
                                          url: website,
                                        ).then(
                                          (value) => GoRouter.of(context).pop(),
                                        );
                                      },
                                      icon: Icon(Iconsax.direct_send,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                      label: Text(
                                        'View Website',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                    adjustWidth(10),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)),
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                          : [
                              kHeight10,
                              Icon(Icons.web_sharp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              kHeight10,
                              Text(
                                'Website details not available',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              kHeight10
                            ],
                    ),
                  ));
                },
              );
            }
          },
          image: gifGlobe,
        ),

        //Address screen
        DetailSharingIconWidget(
          onTap: () async {
            String location = '';

            if (visitingCardController.visitingCardDetails.value.location !=
                    null &&
                visitingCardController
                    .visitingCardDetails.value.location!.isNotEmpty) {
              location =
                  visitingCardController.visitingCardDetails.value.location ??
                      '';
            }
            if (visitingCardController.visitingCardDetails.value != null &&
                visitingCardController.visitingCardDetails.value.location !=
                    null) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Address',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        adjustHieght(10),
                        Text(
                          location,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                        adjustHieght(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              onPressed: () async {
                                await LaunchUrl.launchMap(
                                  address: location,
                                  context: context,
                                ).then((value) => Navigator.pop(context));
                              },
                              icon: const Icon(
                                Iconsax.location,
                                color: kblack,
                              ),
                              label: Text(
                                'ViewMap',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            adjustWidth(10),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          image: gifLocation,
        )
      ],
    );
  }
}
