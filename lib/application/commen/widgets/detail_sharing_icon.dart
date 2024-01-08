import 'package:bizkit/application/commen/const.dart';
import 'package:flutter/material.dart';

class DetailSharingIconWidget extends StatelessWidget {
  const DetailSharingIconWidget({
    super.key,required this.image
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        color: kblack.withOpacity(0.3),
      ),
      height: kwidth * 0.13,
      child: Image.asset(image),
    );
  }
}