import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CardViewAddReminderContainer extends StatelessWidget {
  const CardViewAddReminderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (createdConnectionID != null) {
        //   Navigator.push(
        //     context,
        //     cardFadePageRoute(PreviewHomeAddReminderScreen(
        //         cardId: cardState.anotherCard!.id!,
        //         connectionId: createdConnectionID!)),
        //   );
        // } else if (cardState.anotherCard?.connectionId != null) {
        //   Navigator.push(
        //     context,
        //     cardFadePageRoute(PreviewHomeAddReminderScreen(
        //         cardId: cardState.anotherCard!.id!,
        //         connectionId: cardState.anotherCard!.connectionId!)),
        //   );
        // } else if (cardState.anotherCard?.connectionRequestId == null) {
        //   // context.read<ConnectionRequestBloc>().add(
        //   //     ConnectionRequestEvent.addConnection(
        //   //         createConnectionWithCardIdModel:
        //   //             CreateConnectionWithCardIdModel(
        //   //                 cardId: cardState.anotherCard?.id)));
        // } else {
        //   print('not in conditions');
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
          border: Border.all(
            color: textFieldFillColr,
          ),
        ),
        height: 70,
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