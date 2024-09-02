import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../utils/constants/colors.dart';

class AttendenceMsTeamTimesheetSearchBar extends StatelessWidget {
  const AttendenceMsTeamTimesheetSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: klightGreyClr,
        borderRadius: kBorderRadius15,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
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
