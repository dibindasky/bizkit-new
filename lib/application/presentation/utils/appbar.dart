import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppbarCommen extends StatelessWidget {
  const AppbarCommen({
    super.key,
    this.tittle,
  });

  final String? tittle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: kwhite,
      ),
      backgroundColor: knill,
      title: Text(
        tittle ?? 'Give tittle',
        style: textHeadStyle1,
      ),
    );
  }
}
