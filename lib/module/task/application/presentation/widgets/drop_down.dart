import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(this.label, this.value, this.items, this.onChanged,
      {super.key});
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: neonShade,
          ),
        ),
        adjustHieght(8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: lightGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          dropdownColor: lightGrey,
        ),
      ],
    );
  }
}
