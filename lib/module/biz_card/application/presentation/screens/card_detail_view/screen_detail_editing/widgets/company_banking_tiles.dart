import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BusinessAndBankingDetailsAddingTiles extends StatelessWidget {
  const BusinessAndBankingDetailsAddingTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailCustomTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LinearProgressIndicatorStarting(index: 1),
                  ));
            },
            title: 'Business Details',
            subTitle: ''),
        DetailCustomTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LinearProgressIndicatorStarting(index: 2),
                  ));
            },
            title: 'Logo, Logo Story',
            subTitle: ''),
        DetailCustomTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LinearProgressIndicatorStarting(index: 3),
                  ));
            },
            title: 'Products & Brochure',
            subTitle: ''),
        DetailCustomTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LinearProgressIndicatorStarting(index: 4),
                  ));
            },
            title: 'Banking Details',
            subTitle: ''),
      ],
    );
  }
}

class DetailCustomTile extends StatelessWidget {
  const DetailCustomTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });
  final String title;
  final VoidCallback onTap;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: smallBigGrey,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(title),
            adjustWidth(10),
            Text(
              subTitle,
              style:
                  textStyle1.copyWith(fontSize: kwidth * 0.0245, color: kred),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
