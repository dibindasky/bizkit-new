import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/detail_row_icontext.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/detail_sharing_icon_image.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class BizCardDetailsIconsWidgets extends StatelessWidget {
  const BizCardDetailsIconsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              gifListCardDetail.length,
              (index) => DetailSharingIconBizcardDetail(
                  image: gifListCardDetail[index], onTap: () {}),
            ),
          ),
        ),
        kHeight20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              iconBizcardDetailsText.length,
              (index) => DeatailRowIconTextBizcardDetail(
                  text: iconBizcardDetailsText[index],
                  image: iconBizcardDetails[index],
                  onTap: () {}),
            ),
          ),
        ),
      ],
    );
  }
}