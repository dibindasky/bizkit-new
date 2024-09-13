import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardViewAddReminderContainer extends StatelessWidget {
  const CardViewAddReminderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (createdConnectionID != null) {
        Navigator.push(
          context,
          cardFadePageRoute(
              const ScreenCardReminderCreating(cardId: 2, connectionId: 2)),
        );
        // } else if (cardState.anotherCard?.connectionId != null) {
        //   Navigator.push(
        //     context,
        //     cardFadePageRoute(PreviewHomeAddReminderScreen(
        //         cardId: cardState.anotherCard!.id!,
        //         connectionId: cardState.anotherCard!.connectionId!)),
        //   );
        // } else if (cardState.anotherCard?.connectionRequestId == null) {
        // context.read<ConnectionRequestBloc>().add(
        //     ConnectionRequestEvent.addConnection(
        //         createConnectionWithCardIdModel:
        //             CreateConnectionWithCardIdModel(
        //                 cardId: cardState.anotherCard?.id)));
        // } else {
        //   print('not in conditions');
        // }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
          border: Border.all(
            color: neonShade,
          ),
        ),
        height: 50.w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(
                'asset/images/addButtunIconImage.png',
              ),
            ),
            adjustWidth(kwidth * .03),
            Text('Add Connection', style: textHeadStyle1),
          ],
        ),
      ),
    );
  }
}
