import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceRecordItem extends StatelessWidget {
  final String date;
  final String location;
  final String checkIn;
  final String checkOut;
  final String totalHours;

  const AttendanceRecordItem({
    Key? key,
    required this.date,
    required this.location,
    required this.checkIn,
    required this.checkOut,
    required this.totalHours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      decoration: BoxDecoration(
        color: lightColr,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: textThinerStyle1.copyWith(fontSize: 12.sp),
              ),
              Text(
                location,
                style: textThinStyle1.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
            child: const VerticalDivider(
              color: kwhite,
              thickness: 1,
            ),
          ),
          Text(
            checkIn,
            style: textThinerStyle1.copyWith(fontSize: 12.sp),
          ),
          SizedBox(
            height: 30.h,
            child: const VerticalDivider(
              color: kwhite,
              thickness: 1,
            ),
          ),
          Text(
            checkOut,
            style: textThinerStyle1.copyWith(fontSize: 12.sp),
          ),
          SizedBox(
            height: 30.h,
            child: const VerticalDivider(
              color: kwhite,
              thickness: 1,
            ),
          ),
          Text(
            totalHours,
            style: textThinerStyle1.copyWith(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
