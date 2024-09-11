import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsbasedOnUserConnection extends StatelessWidget {
  const CardsbasedOnUserConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(children: [
        ...List.generate(
          2,
          (index) => Container(
            margin:
                EdgeInsets.only(bottom: 10.w, left: 5.w, right: 5.w, top: 5.w),
            decoration: BoxDecoration(
                border: Border.all(color: neonShade),
                borderRadius: kBorderRadius10),
            child: ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 18,
                backgroundColor: textFieldFillColr,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: neonShade,
                  ),
                ),
              ),
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: kwidth * .040,
                ),
              ),
              subtitle: const Text('Sub'),
            ),
          ),
        )
      ]),
    );
  }
}
