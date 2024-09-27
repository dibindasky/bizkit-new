import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeTimeSheetContainer extends StatelessWidget {
  const EmployeeTimeSheetContainer({
    super.key,
    required this.employeName,
    required this.employeDesignation,
    required this.attendence,
    required this.employeProfile,
    required this.attendenceColor,
  });

  final String employeName;
  final String employeProfile;
  final String employeDesignation;
  final String attendence;
  final Color attendenceColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightColr,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: kblack,
          backgroundImage: AssetImage(employeProfile),
        ),
        title: Text(
          employeName,
          style: textThinStyle1.copyWith(fontSize: 13.sp, color: neonShade),
        ),
        subtitle: Text(
          employeDesignation,
          style: textThinStyle1.copyWith(color: kgrey, fontSize: 10.sp),
        ),
        trailing: Card(
          color: attendenceColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            child: Text(
              attendence,
              style: textThinStyle1.copyWith(fontSize: 10.sp, color: kblack),
            ),
          ),
        ),
      ),
    );
  }
}
