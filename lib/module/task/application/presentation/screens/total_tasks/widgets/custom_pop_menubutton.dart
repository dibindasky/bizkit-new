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
      child: Card(
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            // gradient: neonNewLinearGradient,
            color: kblack,
            borderRadius: kBorderRadius10,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
