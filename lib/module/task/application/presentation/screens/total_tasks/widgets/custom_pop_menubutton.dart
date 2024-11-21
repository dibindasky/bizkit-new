import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomPopupMenuItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [kneon, neonShade]),
          borderRadius: kBorderRadius10,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
