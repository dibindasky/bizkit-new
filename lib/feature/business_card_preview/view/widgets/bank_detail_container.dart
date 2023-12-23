import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankItemWidget extends StatelessWidget {
  const BankItemWidget({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        width: double.infinity,
        height: 91.dm,
        decoration: BoxDecoration(
          border: Border.all(
            color: neonShade,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  first,
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  second,
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
