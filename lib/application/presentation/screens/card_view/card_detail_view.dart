import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/screens/card_view/screen_detail_editing/card_detail_editing_screen.dart';
import 'package:bizkit/application/presentation/screens/card_view/widgets/card_bottom_part.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/commen/card_id_model/card_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCardDetailView extends StatefulWidget {
  const ScreenCardDetailView(
      {super.key, this.cardId, this.myCard = false, this.userId});
  final int? cardId;
  final int? userId;
  final bool myCard;

  @override
  State<ScreenCardDetailView> createState() => _ScreenCardDetailViewState();
}

class _ScreenCardDetailViewState extends State<ScreenCardDetailView> {
  @override
  void initState() {
    if (widget.cardId != null) {
      context
          .read<CardBloc>()
          .add(CardEvent.getCardyCardId(id: widget.cardId!));
      context.read<ReminderBloc>().add(ReminderEvent.getCardReminder(
          cardIdModel: CardIdModel(cardId: widget.cardId!)));
    } else if (widget.userId != null) {
      context
          .read<CardBloc>()
          .add(CardEvent.getCardyUserId(id: widget.userId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Card'),
        actions: [
          widget.myCard
              ? BlocBuilder<CardBloc, CardState>(
                  builder: (context, state) {
                    if (state.cardLoading || state.anotherCard == null) {
                      return const SizedBox();
                    }
                    return IconButton(
                      onPressed: () {
                        if (state.anotherCard!.percentage! == 10) {
                          companySearchNotifier.value = 2;
                        } else if (state.anotherCard!.isCompanyAutofilled!) {
                          companySearchNotifier.value = 1;
                        } else {
                          companySearchNotifier.value = 0;
                        }
                        companySearchNotifier.notifyListeners();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ScreenCardDetailEditingList()));
                        context.read<UserDataBloc>().add(
                            UserDataEvent.getCurrentCard(
                                card: state.anotherCard!));
                        context.read<BusinessDataBloc>().add(
                            BusinessDataEvent.getCurrentCard(
                                card: state.anotherCard!));
                      },
                      icon: const Icon(Icons.edit),
                    );
                  },
                )
              : const SizedBox(),
          adjustWidth(20),
        ],
      ),
      body: BlocConsumer<CardBloc, CardState>(
        listenWhen: (previous, current) =>
            previous.anotherCard != null &&
            current.anotherCard != null &&
            previous.anotherCard?.percentage != current.anotherCard?.percentage,
        listener: (context, state) {
          context.read<CardBloc>().add(const CardEvent.getCards(call: true));
        },
        builder: (context, state) => state.cardLoading
            ? const Center(
                child: CircularProgressIndicator(color: neonShade),
              )
            : state.anotherCard == null
                ? GestureDetector(
                    onTap: () {
                      if (widget.cardId != null) {
                        context
                            .read<CardBloc>()
                            .add(CardEvent.getCardyCardId(id: widget.cardId!));
                        context.read<ReminderBloc>().add(
                            ReminderEvent.getCardReminder(
                                cardIdModel:
                                    CardIdModel(cardId: widget.cardId!)));
                      } else if (widget.userId != null) {
                        context
                            .read<CardBloc>()
                            .add(CardEvent.getCardyUserId(id: widget.userId!));
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
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          adjustHieght(20),
                          // image carosal view
                          BlocBuilder<CardBloc, CardState>(
                            builder: (context, state) {
                              List<String> images = [];
                              bool story = false;
                              if (state.anotherCard != null &&
                                  state.anotherCard!.logoCard != null &&
                                  state.anotherCard!.logoCard!.logo != null) {
                                images.add(state.anotherCard!.logoCard!.logo!
                                        .startsWith('data:')
                                    ? state.anotherCard!.logoCard!.logo!
                                        .substring(22)
                                    : state.anotherCard!.logoCard!.logo!);
                                story = true;
                              }
                              if (state.anotherCard != null &&
                                  state.anotherCard!.personalDetails != null &&
                                  state.anotherCard!.personalDetails!.photos !=
                                      null &&
                                  state.anotherCard!.personalDetails!.photos!
                                      .isNotEmpty) {
                                images.addAll(state
                                    .anotherCard!.personalDetails!.photos!
                                    .map((e) => e.photo!.startsWith('data')
                                        ? e.photo!.substring(22)
                                        : e.photo!)
                                    .toList());
                              }
                              return SizedBox(
                                height: 200,
                                child: PreviewPageviewImageBuilder(
                                  imagesList: images,
                                  story: story
                                      ? state.anotherCard?.logoCard?.logoStory
                                      : null,
                                  storyIndex: story ? 0 : null,
                                ),
                              );
                            },
                          ),
                          // name and designation
                          BlocBuilder<CardBloc, CardState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    state.anotherCard?.isVerified == false
                                        ? state.anotherCard?.personalDetails
                                                ?.name ??
                                            ''
                                        : state.anotherCard?.businessDetails
                                                ?.company ??
                                            '',
                                    overflow: TextOverflow.ellipsis,
                                    style: custumText(fontSize: kwidth * 0.06),
                                  ),
                                  Text(
                                    state.anotherCard?.isVerified == false
                                        ? state.anotherCard?.personalDetails
                                                ?.designation ??
                                            ''
                                        : state.anotherCard?.personalDetails
                                                ?.name ??
                                            '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    state.anotherCard?.isVerified == false
                                        ? state.anotherCard?.businessDetails
                                                ?.company ??
                                            ''
                                        : state.anotherCard?.personalDetails
                                                ?.name ??
                                            '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  adjustHieght(khieght * .02),
                                ],
                              );
                            },
                          ),
                          // card details
                          CardDetailScreenSecondHalf(
                              myCard: widget.myCard,
                              cardId: state.anotherCard!.id!)
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
