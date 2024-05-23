import 'package:bizkit/module/task/application/presentation/widgets/radio_button.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customRadioButton('Official', 'official', context, 'official'),
        ),
        kWidth10,
        Expanded(
          child: customRadioButton('Personal', 'personal', context, 'personal'),
        ),
        Expanded(
          child: customRadioButton('Others', 'others', context, 'others'),
        ),
      ],
    );
  }
}
