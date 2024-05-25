import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class LegendsContainer extends StatelessWidget {
  const LegendsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: khieght * .1,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Legends'),
          adjustHieght(16),
          const FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendItem(color: kred, text: 'Killed'),
                LegendItem(color: kOrange, text: 'Crossed Deadline'),
                LegendItem(color: kblue, text: 'In-Progress'),
                LegendItem(color: neonShade, text: 'Total tasks'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: kBorderRadius10,
            color: color,
          ),
          width: 12,
          height: 12,
        ),
        adjustWidth(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            text,
            style: textStyle1,
          ),
        ),
      ],
    );
  }
}
