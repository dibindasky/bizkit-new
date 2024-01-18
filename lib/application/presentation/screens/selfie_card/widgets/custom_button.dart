import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonSelfie extends StatelessWidget {
  const CustomButtonSelfie({
    required this.navigate,
    super.key,
  });
  final Widget navigate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: neonShade),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 123.dm,
            height: 45.dm,
            child: const Center(child: Text('Discard')),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(fadePageRoute(navigate)),
          child: Container(
            decoration: const BoxDecoration(
              color: neonShade,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 123.dm,
            height: 45.dm,
            child: const Center(child: Text('Save')),
          ),
        ),
      ],
    );
  }
}
