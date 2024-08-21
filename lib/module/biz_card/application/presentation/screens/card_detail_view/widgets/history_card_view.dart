import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMeetingDetailHistoryCardBuilder extends StatefulWidget {
  const CardMeetingDetailHistoryCardBuilder({super.key});

  // final int cardId;

  @override
  State<CardMeetingDetailHistoryCardBuilder> createState() =>
      _CardMeetingDetailHistoryCardBuilderState();
}

class _CardMeetingDetailHistoryCardBuilderState
    extends State<CardMeetingDetailHistoryCardBuilder> {
  //final ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       // context.read<ReminderBloc>().add(ReminderEvent.getCardReminderNext(
  //       //     cardIdModel: CardIdModel(cardId: widget.cardId)));
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: 400.h,
        child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 14,
            itemBuilder: (context, index) {
              // if (index == 0) {
              //   return ShimmerLoader(
              //       itemCount: 1,
              //       height: 50,
              //       width: kwidth,
              //       seprator: adjustHieght(10));
              // }
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
                                'Date',
                                style: TextStyle(fontSize: kwidth * .035),
                              ),
                            ],
                          ),
                          adjustHieght(khieght * .006),
                          Text(
                            'Scheduled on ${'Time'} to discuss about ${'Mesage'}.',
                            style: TextStyle(fontSize: kwidth * .035),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
