import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.wdth,
  });
  final String text;
  final VoidCallback onTap;
  final double? wdth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: wdth ?? 150,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
          gradient: neonShadeGradient,
        ),
        child: Center(
          child: Text(
            text,
            style: custumText(
              fontSize: kwidth * 0.033,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
