import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.selected,
    required this.text,
    required this.onChanged,
  });

  final bool selected;
  final String text;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          !selected
              ? const CircleAvatar(
                  backgroundColor: kneon,
                  radius: 8,
                  child: CircleAvatar(
                    backgroundColor: kblack,
                    radius: 6,
                  ),
                )
              : const CircleAvatar(
                  backgroundColor: kneon,
                  radius: 10,
                  child: CircleAvatar(
                    backgroundColor: kblack,
                    radius: 9,
                    child: CircleAvatar(
                      backgroundColor: kneon,
                      radius: 8,
                    ),
                  ),
                ),
          kWidth5,
          Text(
            text,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(),
          ),
        ],
      ),
    );
  }
}
