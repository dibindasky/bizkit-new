import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class LastSkipContinueButtons extends StatelessWidget {
  const LastSkipContinueButtons(
      {super.key, this.onTap, this.onSkipTap, this.continueText = 'Continue'});

  final VoidCallback? onTap;
  final VoidCallback? onSkipTap;
  final String continueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: onSkipTap == null
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceAround,
      children: [
        onSkipTap == null
            ? const SizedBox()
            : InkWell(
                onTap: onSkipTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: neonShade),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Text('Skip'),
                  ),
                ),
              ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: const BoxDecoration(
              color: neonShade,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(child: Text(continueText)),
          ),
        ),
      ],
    );
  }
}
