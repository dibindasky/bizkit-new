import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/domain/model/commen/card_id_model/card_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingDetailHistoryCardBuilder extends StatefulWidget {
  const MeetingDetailHistoryCardBuilder({super.key, required this.cardId});

  final int cardId;

  @override
  State<MeetingDetailHistoryCardBuilder> createState() =>
      _MeetingDetailHistoryCardBuilderState();
}

class _MeetingDetailHistoryCardBuilderState
    extends State<MeetingDetailHistoryCardBuilder> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<ReminderBloc>().add(ReminderEvent.getCardReminderNext(
            cardIdModel: CardIdModel(cardId: widget.cardId)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          if (state.isLoading) {
            return ShimmerLoader(
                itemCount: 5,
                height: 50,
                width: kwidth,
                seprator: adjustHieght(10));
          } else if (state.cardReminderList != null &&
              state.cardReminderList!.isNotEmpty) {
            return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: state.isPageLoading
                    ? state.cardReminderList!.length + 1
                    : state.cardReminderList!.length,
                itemBuilder: (context, index) {
                  if (index == state.cardReminderList!.length) {
                    return ShimmerLoader(
                        itemCount: 1,
                        height: 50,
                        width: kwidth,
                        seprator: adjustHieght(10));
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: ColoredBox(
                        color: smallBigGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    imageHistoryList[index % 4],
                                    fit: BoxFit.cover,
                                  ),
                                  adjustWidth(kwidth * .004),
                                  Text(
                                    state.cardReminderList?[index].date ?? '',
                                    style: TextStyle(fontSize: kwidth * .035),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .006),
                              Text(
                                'Scheduled on ${state.cardReminderList?[index].date ?? ''} to discuss about ${state.cardReminderList?[index].message ?? ''}.',
                                style: TextStyle(fontSize: kwidth * .035),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Column(
              children: [
                const Text('No history found'),
                Expanded(child: FittedBox(child: Image.asset(emptyNodata1)))
              ],
            );
          }
        },
      ),
    );
  }
}
