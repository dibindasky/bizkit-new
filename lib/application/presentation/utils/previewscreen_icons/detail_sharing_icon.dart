import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailSharingIconWidget extends StatelessWidget {
  const DetailSharingIconWidget(
      {super.key, required this.image, required this.onTap});
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          color: kblack.withOpacity(0.3),
        ),
        height: kwidth * 0.13,
        child: Image.asset(image),
      ),
    );
  }
}
