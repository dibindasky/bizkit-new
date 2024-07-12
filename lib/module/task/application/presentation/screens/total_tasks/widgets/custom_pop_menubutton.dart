import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [neonShade, neonShade, lightGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: kBorderRadius10,
        ),
        child: Text(
          text,
          style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
