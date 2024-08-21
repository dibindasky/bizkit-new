import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ScreenCardSecondDetailView extends StatefulWidget {
  const ScreenCardSecondDetailView({super.key});
  //final int? cardId;

  @override
  State<ScreenCardSecondDetailView> createState() =>
      _ScreenCardSecondDetailViewState();
}

class _ScreenCardSecondDetailViewState
    extends State<ScreenCardSecondDetailView> {
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              // await sharePdfFromBase64(state.getSecondCardModel?.pdf ?? '',
              //     state.getSecondCardModel?.name ?? '');
            },
            icon: const Icon(Icons.share),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              adjustHieght(20),
              // image carosal view
              const SizedBox(
                height: 200,
                child: PreviewPageviewImageBuilder(
                  isStory: false,
                  imagesList: [],
                ),
              ),
              // name and designation
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '',
                    overflow: TextOverflow.ellipsis,
                    style: custumText(fontSize: kwidth * 0.06),
                  ),
                  const Text(
                    'Company',
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'designation',
                    overflow: TextOverflow.ellipsis,
                  ),
                  adjustHieght(khieght * .02),
                ],
              ),
              const CardViewRowWiceIcons(),
              adjustHieght(khieght * .02),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: neonShade),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    adjustHieght(10),
                    const ItemsContainer(
                      heading: 'Location',
                      item: 'Location',
                    ),
                    const ItemsContainer(
                      heading: 'Occasion',
                      item: 'Occation',
                    ),
                    const ItemsContainer(
                      heading: 'Occupation',
                      item: 'Occupation',
                    ),
                    const ItemsContainer(
                      heading: 'Designation',
                      item: 'Designation',
                    ),
                    const ItemsContainer(
                      heading: 'Notes',
                      item: 'Notes',
                    ),
                    const ItemsContainer(
                      heading: 'Date',
                      item: 'Date',
                    ),
                    const ItemsContainer(
                      heading: 'Time',
                      item: 'Time',
                      istime: false,
                    ),
                    adjustHieght(10),
                  ],
                ),
              ),
              adjustHieght(30),
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
                        child: Text(item != "" ? heading : '')),
                    const Text(':   ', style: TextStyle(color: neonShade)),
                    Expanded(child: Text(item ?? '')),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //phone number botom sheet

        DetailSharingIconWidget(
          onTap: () {
            List<String> items = [];
            // items.add(state.getSecondCardModel!.phoneNumber!);
            log('${items.length}');
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isDismissible: true,
              showDragHandle: true,
              backgroundColor: kblack,
              builder: (context) => PreviewScreenRowIconsModelSheet(
                fromPreview: true,
                image: imagePhone,
                items: items,
                itemsHeading: const ['Phone number'],
              ),
            );
          },
          image: imagePhone,
        ),
        // email bottom sheet

        DetailSharingIconWidget(
          onTap: () {
            List<String> items = [];
            // items.add(state.getSecondCardModel!.email!);
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
                itemsHeading: const ['Email'],
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundColour),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Website', style: textHeadStyle1),
                      adjustHieght(10),
                      TextButton(
                        onPressed: () async {
                          // await LaunchUrl.googleSearch(
                          //   url: state.getSecondCardModel!.website!,
                          // ).then((value) => Navigator.pop(context));
                        },
                        child: Text(
                          'Text',
                          style: textStyle1.copyWith(
                            color: kblue,
                            decoration: TextDecoration.underline,
                            decorationColor: kblue,
                          ),
                        ),
                      ),
                      adjustHieght(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: neonShade)),
                            onPressed: () async {
                              // await LaunchUrl.googleSearch(
                              //   url: state.getSecondCardModel!.website!,
                              // ).then((value) => Navigator.pop(context));
                            },
                            icon: const Icon(Icons.webhook_rounded),
                            label: const Text(
                              'View site',
                              style: TextStyle(color: neonShade),
                            ),
                          ),
                          adjustWidth(10),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: neonShade)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: neonShade),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          image: gifGlobe,
        ),

        //Address screen
        DetailSharingIconWidget(
          onTap: () async {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundColour),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Address',
                        style: textHeadStyle1,
                      ),
                      adjustHieght(10),
                      const Text(
                        'Text',
                      ),
                      adjustHieght(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: neonShade)),
                            onPressed: () async {
                              // await LaunchUrl.launchMap(
                              //   address: state.getSecondCardModel!.location!,
                              //   context: context,
                              // ).then((value) => Navigator.pop(context));
                            },
                            icon: const Icon(
                              Icons.location_on_outlined,
                            ),
                            label: const Text(
                              'ViewMap',
                              style: TextStyle(color: neonShade),
                            ),
                          ),
                          adjustWidth(10),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: neonShade)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: neonShade),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          image: gifLocation,
        )
      ],
    );
  }
}
