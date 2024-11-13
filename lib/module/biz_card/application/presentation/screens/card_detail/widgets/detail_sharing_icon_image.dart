import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class DetailSharingIconBizcardDetail extends StatelessWidget {
  const DetailSharingIconBizcardDetail(
      {super.key, required this.image, required this.onTap});
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          color: kblack,
        ),
        height: kwidth * 0.13,
        width: kwidth * 0.13,
        child: Image.asset(image),
      ),
    );
  }
}
