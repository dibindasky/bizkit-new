import 'package:bizkit/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../utils/constants/constant.dart';
import 'calender_bottom_sheet.dart';

class AttendenceAddNewLeaveScreen extends StatefulWidget {
  const AttendenceAddNewLeaveScreen({super.key});

  @override
  State<AttendenceAddNewLeaveScreen> createState() =>
      _AttendenceAddNewLeaveScreenState();
}

class _AttendenceAddNewLeaveScreenState
    extends State<AttendenceAddNewLeaveScreen> {
  String? leaveType;
  final TextEditingController selectDateTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.attendenceLeaves, id: 22);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        const Text(
                          'Apply for',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                adjustHieght(15.h),
                Container(
                  width: 320.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: lightColr,
                    borderRadius: kBorderRadius5,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          leaveType ?? 'Leave Type',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      items: <String>[
                        'Sick Leave',
                        'Casual Leave',
                        'Paternity Leave',
                        'Late request',
                        'Work form home',
                        'Client visit',
                        'Late login',
                        'Early logout',
                        'Over time',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: kwhite, fontSize: 14),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          leaveType = value;
                        });
                      },
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 320.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: lightColr,
                    borderRadius: kBorderRadius5,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Reason',
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 320.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: lightColr,
                    borderRadius: kBorderRadius5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 17),
                        child: Text(
                          'Attachments if any',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        width: 105.w,
                        height: 55.h,
                        child: const Center(
                          child: Text(
                            'Browse',
                            style: TextStyle(
                                color: kblack, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                adjustHieght(15.h),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return CalendarBottomSheet(
                          datePicker: selectDateTextEditingController,
                          onPressed: (p0) {},
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 320.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: lightColr,
                      borderRadius: kBorderRadius5,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date'),
                          Icon(Icons.calendar_month_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
