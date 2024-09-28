import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RuleCard extends StatelessWidget {
  final int ruleNumber;

  const RuleCard({Key? key, required this.ruleNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Rule No.$ruleNumber',
            style: textThinStyle1.copyWith(
              color: neonShade,
            ),
          ),
        ),
        Card(
          color: lightColr,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User interface (UI) is anything a user may interact '
                  'with to use a digital product or service. This '
                  'includes everything from screens and '
                  'touchscreens, keyboards, sounds, and even lights. '
                  'To understand the evolution of UI, however, it\'s '
                  'helpful to learn a bit more about its history and '
                  'how it has evolved into best practices and a '
                  'profession.',
                  style: textThinStyle1.copyWith(color: kwhite),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
