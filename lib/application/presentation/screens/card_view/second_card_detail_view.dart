import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/show_model_items.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:bizkit/application/presentation/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCardDetailView extends StatelessWidget {
  const SecondCardDetailView({
    super.key,
    this.cardId,
    this.myCard = false,
  });
  final int? cardId;
  final bool myCard;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (cardId != null) {
        context
            .read<CardSecondBloc>()
            .add(CardSecondEvent.getSecondCardDetail(id: cardId!));
      }
    });

    return BlocBuilder<CardSecondBloc, CardSecondState>(
      // buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
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
                      child: Text('QR card not found'),
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
                                  images = (state.getSecondCardModel!.image!);
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
                            // !myCard
                            //     ? const CardViewAddReminderContainer()
                            //     : const SizedBox(),
                            // row icons
                            const CardViewRowWiceIcons(),
                            adjustHieght(khieght * .02),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: neonShade,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      adjustHieght(10),
                                      const Text('Venue'),
                                      const Text('Location'),
                                      const Text('Occupation'),
                                      const Text('Designation'),
                                      const Text('Date'),
                                      const Text('Time'),
                                      const Text('Notes'),
                                      adjustHieght(10),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      adjustHieght(10),
                                      Text(
                                          '${state.getSecondCardModel!.whereWeMet}'),
                                      Text(
                                          '${state.getSecondCardModel!.location}'),
                                      Text(
                                          '${state.getSecondCardModel!.occupation}'),
                                      Text(
                                          '${state.getSecondCardModel!.designation}'),
                                      Text('${state.getSecondCardModel!.date}'),
                                      Text('${state.getSecondCardModel!.time}'),
                                      Text(
                                          '${state.getSecondCardModel!.notes}'),
                                      adjustHieght(10),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
        );
      },
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
                if (state.getSecondCardModel != null &&
                    state.getSecondCardModel!.website != null) {
                  LaunchUrl.launchUrls(url: state.getSecondCardModel!.website!);
                }
              },
              image: gifGlobe,
            ),
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
