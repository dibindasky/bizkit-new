import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/routes/routes.dart';

class AttendencePeltAndPellAppbar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const AttendencePeltAndPellAppbar(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
