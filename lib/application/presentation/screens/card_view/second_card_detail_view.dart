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
                : Text(state.getSecondCardModel?.name ?? 'No name',
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
                                  String images = '';
                                  images = (state.getSecondCardModel!.image!);
                                  images = images.replaceFirst(
                                      RegExp(r'data:image/jpg;base64,'), '');
                                  imagess.add(images);
                                }
                                if (state.getSecondCardModel != null &&
                                    state.getSecondCardModel!.selfie != null) {
                                  String images = '';
                                  images = (state.getSecondCardModel!.selfie!);
                                  images = images.replaceFirst(
                                      RegExp(r'data:image/jpg;base64,'), '');
                                  imagess.add(images);
                                }
                                return SizedBox(
                                  height: 200,
                                  child: PreviewPageviewImageBuilder(
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
                              padding:
                                  const EdgeInsets.only(right: 10, left: 20),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: neonShade,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  adjustHieght(10),
                                  ItemsContainer(
                                    heading: 'Location',
                                    item: state.getSecondCardModel?.location ??
                                        '',
                                  ),
                                  ItemsContainer(
                                    heading: 'Occasion',
                                    item:
                                        state.getSecondCardModel?.whereWeMet ??
                                            '',
                                  ),
                                  ItemsContainer(
                                    heading: 'Occupation',
                                    item:
                                        state.getSecondCardModel?.occupation ??
                                            '',
                                  ),
                                  ItemsContainer(
                                    heading: 'Designation',
                                    item:
                                        state.getSecondCardModel?.designation ??
                                            '',
                                  ),
                                  ItemsContainer(
                                      heading: 'Date',
                                      item:
                                          state.getSecondCardModel?.date ?? ''),
                                  ItemsContainer(
                                    heading: 'Time',
                                    item: formattedTime,
                                  ),
                                  ItemsContainer(
                                    heading: 'Notes',
                                    item: state.getSecondCardModel?.notes ?? '',
                                  ),
                                  adjustHieght(10),
                                ],
                              ),
                            ),
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
  const ItemsContainer({super.key, required this.item, required this.heading});
  final String item;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item != ''
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: kwidth * .3,
                    child: Text(item != "" ? heading : ''),
                  ),
                  Expanded(child: Text(item)),
                ],
              )
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
            DetailSharingIconWidget(
              onTap: () {
                List<String> items = [];
                if (state.getSecondCardModel != null &&
                    state.getSecondCardModel!.phoneNumber != null) {
                  items.add(state.getSecondCardModel!.phoneNumber!);
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
                if (state.getSecondCardModel != null &&
                    state.getSecondCardModel!.email != null) {
                  items.add(state.getSecondCardModel!.email!);
                } else {
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
                                  adjustHieght(10),
                                  Text(
                                    'Websie details not available',
                                    style: textHeadStyle1,
                                  ),
                                  adjustHieght(10)
                                ],
                              ),
                            ),
                          ));
                }
                if (state.getSecondCardModel != null &&
                    state.getSecondCardModel!.email != null) {
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
                }
              },
              image: gifMail,
            ),
            // website navigator
            state.getSecondCardModel != null &&
                    state.getSecondCardModel!.website != null
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
                                Text(
                                  state.getSecondCardModel!.location ?? '',
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
                                        LaunchUrl.launchUrls(
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
                                        'cancel',
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
            state.getSecondCardModel != null &&
                    state.getSecondCardModel!.location != null
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: neonShade)),
                                      onPressed: () async {
                                        await LaunchUrl.launchMap(
                                                address: state
                                                    .getSecondCardModel!
                                                    .location!,
                                                context: context)
                                            .then((value) =>
                                                Navigator.pop(context));
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
                                        'cancel',
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
                    image: gifLocation,
                  )
                : kempty
          ],
        );
      },
    );
  }
}