import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/screen_detail_editing/card_detail_editing_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CardViewCompletionPersentageIndicator extends StatelessWidget {
  const CardViewCompletionPersentageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: knill,
      onTap: () {
        // if (state.anotherCard!.percentage! == 10) {
        //   companySearchNotifier.value = 2;
        // } else if (state.anotherCard!.isCompanyAutofilled!) {
        //   companySearchNotifier.value = 1;
        // } else {
        //   companySearchNotifier.value = 0;
        // }
        companySearchNotifier.notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ScreenCardDetailEditingList()));
        // context
        //     .read<UserDataBloc>()
        //     .add(UserDataEvent.getCurrentCard(card: state.anotherCard!));
        // context.read<BusinessDataBloc>().add(
        //     BusinessDataEvent.getCurrentCard(card: state.anotherCard!));
      },
      child: Container(
        width: kwidth,
        decoration: BoxDecoration(
            color: kgrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: neonShade)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Profile Completion', style: textHeadStyle1),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text('${'state.anotherCard?.percentage ?? 100'}%')),
              ],
            ),
            adjustHieght(10),
            LinearProgressIndicator(
                value: (100) / 100,
                backgroundColor: kgrey,
                minHeight: 15,
                borderRadius: BorderRadius.circular(50)),
            adjustHieght(10),
            FittedBox(
              child: Text(
                'Complete all the details to get the perfect card for your bussiness',
                style: textStyle1.copyWith(shadows: [
                  const Shadow(
                      color: kblack, offset: Offset(1, 2), blurRadius: 5)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}