import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CardDetailEditingButtonContainer extends StatelessWidget {
  const CardDetailEditingButtonContainer({super.key, this.text, this.child});

  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: kBorderRadius15,
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      padding: const EdgeInsets.only(left: 12, right: 12),
      height: 48.0,
      child: child ??
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
    );
  }
}
