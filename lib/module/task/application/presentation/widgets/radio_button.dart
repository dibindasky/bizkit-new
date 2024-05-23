import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

Widget customRadioButton(
  String label,
  String value,
  BuildContext context,
  String? selectedRadio, {
  Function(String?)? onChanged,
}) {
  return GestureDetector(
    onTap: () {
      if (value == 'cash') {}
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectedRadio == value ||
                (selectedRadio != 'official' &&
                    selectedRadio != 'personal' &&
                    selectedRadio != 'others')
            ? const CircleAvatar(
                backgroundColor: neonShade,
                radius: 8,
                child: CircleAvatar(
                  backgroundColor: kblack,
                  radius: 6,
                ),
              )
            : const SizedBox(),
        Text(
          label,
        ),
      ],
    ),
  );
}
