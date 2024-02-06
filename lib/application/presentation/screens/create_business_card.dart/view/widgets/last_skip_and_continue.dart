import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSkipContinueButtons extends StatelessWidget {
  LastSkipContinueButtons({
    super.key,
    this.onTap,
    this.isAvoidSkip,
  });

  bool? isAvoidSkip = false;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isAvoidSkip == true
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceAround,
      children: [
        isAvoidSkip == true
            ? const SizedBox()
            : Container(
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
