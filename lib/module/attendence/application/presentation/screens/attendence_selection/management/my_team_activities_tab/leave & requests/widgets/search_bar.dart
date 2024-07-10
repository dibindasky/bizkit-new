import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../utils/constants/colors.dart';

class AttendenceMsLeaveRequestsSearchBar extends StatelessWidget {
  const AttendenceMsLeaveRequestsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: klightGreyClr,
        borderRadius: kBorderRadius15,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Employee',
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: neonShade,
              )),
        ),
      ),
    );
  }
}
