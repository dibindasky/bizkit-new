import 'dart:developer';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/application/presentation/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SecondCardDetailView extends StatefulWidget {
  const SecondCardDetailView({
    super.key,
    this.cardId,
    this.myCard = false,
  });
  final int? cardId;
  final bool myCard;

  @override
  State<SecondCardDetailView> createState() => _SecondCardDetailViewState();
}

class _SecondCardDetailViewState extends State<SecondCardDetailView> {
  @override
  void initState() {
    if (widget.cardId != null) {
      context
          .read<CardSecondBloc>()
          .add(CardSecondEvent.getSecondCardDetail(id: widget.cardId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardSecondBloc, CardSecondState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        String formattedTime = '';
        if (state.getSecondCardModel != null &&
            state.getSecondCardModel!.time != null) {
          final timestampStr = state.getSecondCardModel?.time ?? '';
          DateTime timestamp = DateFormat("HH:mm:ss.S").parse(timestampStr);
          // Extract hour, minute, and second
          int hour = timestamp.hour;
          int minute = timestamp.minute;
          int second = timestamp.second;
          // Determine AM or PM
          String amPm = hour >= 12 ? 'PM' : 'AM';
          // Convert to 12-hour format
          int hour12 = hour % 12 == 0 ? 12 : hour % 12;
          // Format the time
          formattedTime =
              '$hour12:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} $amPm';
        }
        return Scaffold(
          appBar: AppBar(
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
            title: state.isLoading
                ? null
                : Text(state.getSecondCardModel?.name ?? '',
                    style: textHeadStyle1),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: neonShade),
                )
              : state.getSecondCardModel == null
                  ? const Center(
                      child: Text('Card not found'),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            adjustHieght(20),
                            // image carosal view
                            BlocBuilder<CardSecondBloc, CardSecondState>(
                              builder: (context, state) {
                                List<String> imagess = [];
                                if (state.getSecondCardModel != null &&
                                    state.getSecondCardModel!.image != null) {
                                  String scanImage = '';
                                  scanImage =
                                      (state.getSecondCardModel!.image!);
                                  scanImage = scanImage.startsWith('data')
                                      ? scanImage.substring(22)
                                      : scanImage;
                                  imagess.add(scanImage);
                                }
                                if (state.getSecondCardModel != null &&
                                    state.getSecondCardModel!.selfie != null) {
                                  List<String> selfieBase64List = [];
                                  if (state.getSecondCardModel != null &&
                                      state.getSecondCardModel!.selfie !=
                                          null) {
                                    for (var image
                                        in state.getSecondCardModel!.selfie!) {
                                      String im = image.selfie!;
                                      im = im.startsWith('data')
                                          ? im.substring(22)
                                          : im;
                                      selfieBase64List.add(im);
                                    }
                                  }
                                  imagess.addAll(selfieBase64List);
                                }
                                return SizedBox(
                                  height: 200,
                                  child: PreviewPageviewImageBuilder(
                                    isStory: true,
                                    imagesList: imagess,
                                  ),
                                );
                              },
                            ),
                            // name and designation
                            BlocBuilder<CardSecondBloc, CardSecondState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(
                                      state.getSecondCardModel?.name ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          custumText(fontSize: kwidth * 0.06),
                                    ),
                                    Text(
                                      state.getSecondCardModel?.company ??
                                          'Company',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      state.getSecondCardModel?.designation ??
                                          'designation',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    adjustHieght(khieght * .02),
                                  ],
                                );
                              },
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
                                    item: state.getSecondCardModel?.location,
                                  ),
                                  ItemsContainer(
                                    heading: 'Occasion',
                                    item: state.getSecondCardModel?.whereWeMet,
                                  ),
                                  ItemsContainer(
                                    heading: 'Occupation',
                                    item: state.getSecondCardModel?.occupation,
                                  ),
                                  ItemsContainer(
                                    heading: 'Designation',
                                    item: state.getSecondCardModel?.designation,
                                  ),
                                  ItemsContainer(
                                    heading: 'Notes',
                                    item: state.getSecondCardModel?.notes,
                                  ),
                                  ItemsContainer(
                                    heading: 'Date',
                                    item: state.getSecondCardModel?.date,
                                  ),
                                  ItemsContainer(
                                    heading: 'Time',
                                    item: formattedTime,
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
      },
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
    return BlocBuilder<CardSecondBloc, CardSecondState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //phone number botom sheet
            if (state.getSecondCardModel!.phoneNumber != null &&
                state.getSecondCardModel!.phoneNumber!.isNotEmpty)
              DetailSharingIconWidget(
                onTap: () {
                  List<String> items = [];
                  items.add(state.getSecondCardModel!.phoneNumber!);
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
            if (state.getSecondCardModel != null &&
                state.getSecondCardModel!.email != null &&
                state.getSecondCardModel!.email!.isNotEmpty)
              DetailSharingIconWidget(
                onTap: () {
                  List<String> items = [];
                  items.add(state.getSecondCardModel!.email!);
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
            state.getSecondCardModel != null &&
                    state.getSecondCardModel!.website != null &&
                    state.getSecondCardModel!.website!.isNotEmpty
                ? DetailSharingIconWidget(
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
                              children: [
                                Text('Website', style: textHeadStyle1),
                                adjustHieght(10),
                                TextButton(
                                  onPressed: () async {
                                    await LaunchUrl.googleSearch(
                                      url: state.getSecondCardModel!.website!,
                                    ).then((value) => Navigator.pop(context));
                                  },
                                  child: Text(
                                    state.getSecondCardModel!.website ?? '',
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
                                          side: const BorderSide(
                                              color: neonShade)),
                                      onPressed: () async {
                                        await LaunchUrl.googleSearch(
                                          url: state
                                              .getSecondCardModel!.website!,
                                        ).then(
                                            (value) => Navigator.pop(context));
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
                                          side: const BorderSide(
                                              color: neonShade)),
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
                  )
                : kempty,

            //Address screen
            state.getSecondCardModel != null &&
                    state.getSecondCardModel!.location != null &&
                    state.getSecondCardModel!.location!.isNotEmpty
                ? DetailSharingIconWidget(
                    onTap: () async {
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
                              children: [
                                Text(
                                  'Address',
                                  style: textHeadStyle1,
                                ),
                                adjustHieght(10),
                                Text(
                                  state.getSecondCardModel!.location ?? '',
                                ),
                                adjustHieght(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: neonShade)),
                                      onPressed: () async {
                                        await LaunchUrl.launchMap(
                                          address: state
                                              .getSecondCardModel!.location!,
                                          context: context,
                                        ).then(
                                            (value) => Navigator.pop(context));
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
                                          side: const BorderSide(
                                              color: neonShade)),
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
                : kempty
          ],
        );
      },
    );
  }
}
