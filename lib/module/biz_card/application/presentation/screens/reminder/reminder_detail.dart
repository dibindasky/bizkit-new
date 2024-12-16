import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_create_update.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/widgets/history_cards_reminders.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardReminderDetailScreen extends StatelessWidget {
  const BizcardReminderDetailScreen({super.key, required this.reminder});
  final Reminder reminder;
  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    final connectionsController = Get.find<ConnectionsController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  adjustWidth(20.w),
                  Text(
                    reminder.meetingLabel ?? '',
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
              adjustHieght(20.h),
              Card(
                child: Container(
                  height: 230..h,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      color: kGreyNormal,
                      image: DecorationImage(
                        image: AssetImage(
                          bizcardBgImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(chatSectionPersonDummyImg2),
                          ),
                          kWidth20,
                          Text(
                            reminder.meetingLabel ?? 'Lebel',
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      adjustHieght(20.h),
                      buildTextRow('Name', reminder.ownerName ?? '', context),
                      buildTextRow(
                          'Description', reminder.description ?? '', context),
                      buildTextRow('Venue', reminder.venue ?? '', context),
                      buildTextRow(
                          'Created',
                          DateTimeFormater.formatTimeAMPMDate(
                              reminder.reminderDate ?? ''),
                          context),
                      buildTextRow(
                          'Occation', reminder.occasion ?? '', context),
                    ],
                  ),
                ),
              ),
              adjustHieght(10.h),
              Row(
                children: [
                  kWidth10,
                  buildButton(
                    context: context,
                    borderRadius: kBorderRadius10,
                    backgroundColor: kneon,
                    text: 'View card',
                    onTap: () {
                      GoRouter.of(context).pop(context);
                      connectionsController.getConnectionCardDetail(
                        uid:reminder.userId??'' ,
                          cardId: reminder.cardId ?? '');
                      GoRouter.of(context).pushNamed(Routes.cardDetailView,
                          pathParameters: {
                            'cardId': reminder.cardId ?? '',
                            'myCard': 'false',
                            'fromPreview': 'false'
                          });
                    },
                  ),
                  kWidth5,
                  buildButton(
                    context: context,
                    borderRadius: kBorderRadius10,
                    border: Border.all(color: kneon),
                    text: 'Postpone',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BizcardReminderCreateUpdateScreen(
                                  reminder: reminder),
                        ),
                      );
                    },
                  ),
                  kWidth10,
                ],
              ),
              adjustHieght(20.h),
              Expanded(
                  child: HistoryCardsReminders(
                      reminderController: reminderController))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextRow(String label, String? value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            '$label ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          child: Text(
            value ?? '',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget buildButton(
      {required String text,
      required VoidCallback onTap,
      Color? backgroundColor,
      Color? textColor,
      Border? border,
      BorderRadius? borderRadius,
      EdgeInsets? padding,
      required BuildContext context}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}
