import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CardBankingPersonalTiles extends StatelessWidget {
  const CardBankingPersonalTiles({
    super.key,
    required this.first,
    required this.second,
  });

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: kBorderRadius20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                Text(
                  first,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                kHeight5,
                Text(
                  second,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                kHeight10
              ],
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.arrow_right),
            // ),
          ],
        ),
      ),
    );
  }
}
