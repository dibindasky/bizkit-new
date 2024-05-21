import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingDetailHistoryLogTabBuilder extends StatelessWidget {
  const MeetingDetailHistoryLogTabBuilder({super.key});

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
          } else if (state.reminderResponse != null &&
              state.reminderResponse!.history != null &&
              state.reminderResponse!.history!.isNotEmpty) {
            return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: state.reminderResponse!.history!.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                                      state.reminderResponse?.date ?? '',
                                      style: TextStyle(fontSize: kwidth * .035),
                                    ),
                                  ],
                                ),
                                adjustHieght(khieght * .006),
                                Text(
                                  'Scheduled on ${state.reminderResponse?.date ?? ''} to discuss about ${state.reminder?.message ?? ''}.',
                                  style: TextStyle(fontSize: kwidth * .035),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
          } else {
            return Column(
              children: [
                Text(
                    'No history with ${state.reminder?.name ?? 'Bizkit user'}'),
                Expanded(child: FittedBox(child: Image.asset(emptyNodata1)))
              ],
            );
          }
        },
      ),
    );
  }
}
