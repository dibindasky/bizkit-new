import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key, this.width = 0.2, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: kwidth * width!,
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulse, colors: colors ?? [neonShade]),
      ),
    );
  }
}
