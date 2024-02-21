import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSkipContinueButtons extends StatelessWidget {
  const LastSkipContinueButtons({
    super.key,
    this.onTap,
    this.onSkipTap,
  });

  final VoidCallback? onTap;
  final VoidCallback? onSkipTap;

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
                  decoration: BoxDecoration(
                    border: Border.all(color: neonShade),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: const Center(
                    child: Text('Skip'),
                  ),
                ),
              ),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: neonShade,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 123.dm,
            height: 45.dm,
            child: const Center(child: Text('Continue')),
          ),
        ),
      ],
    );
  }
}
