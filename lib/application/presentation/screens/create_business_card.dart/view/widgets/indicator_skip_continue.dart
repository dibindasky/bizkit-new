import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipContinueIndicator extends StatelessWidget {
  const SkipContinueIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: neonShade),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: 123.dm,
          height: 45.dm,
          child: const Center(child: Text('Skip')),
        ),
        InkWell(
          onTap: () => pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: neonShade,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 123.dm,
            height: 45.dm,
            child: const Center(
              child: Text('Continue'),
            ),
          ),
        )
      ],
    );
  }
}
