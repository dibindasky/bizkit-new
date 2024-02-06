import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class BrocherBuilder extends StatelessWidget {
  const BrocherBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Image.asset(pdfImage);
      },
    );
  }
}
