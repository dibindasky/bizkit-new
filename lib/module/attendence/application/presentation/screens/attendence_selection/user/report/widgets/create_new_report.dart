// ignore_for_file: must_be_immutable

import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_success_dialog.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../utils/widgets/appbar.dart';
import '../../../../../../../../../utils/widgets/event_button.dart';

class AttendenceCreateNewReportScreen extends StatefulWidget {
  const AttendenceCreateNewReportScreen({super.key});

  @override
  State<AttendenceCreateNewReportScreen> createState() =>
      _AttendenceCreateNewReportScreenState();
}

class _AttendenceCreateNewReportScreenState
    extends State<AttendenceCreateNewReportScreen> {
  String? reportType;
  String? departmentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
            child: Column(
              children: [
                const CardAppbarCommen(
                  tittle: 'New Report',
                ),
                // const AttendenceReportAppbar(
                //   title: 'New Report',
                // ),
                adjustHieght(30.h),
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
                          reportType ?? 'Report About',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      items: <String>[
                        'ClockIn Not Working',
                        'Network problem',
                        'Server downtime',
                        'Leave Request Issue',
                        'System outage',
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
                          reportType = value;
                        });
                      },
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
                          departmentType ?? 'Department',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      items: <String>[
                        'Hr',
                        'Development',
                        'Test',
                        'Other',
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
                          departmentType = value;
                        });
                      },
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 320.w,
                  height: 170.h,
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
                        hintText: 'Write here',
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
                  height: 50.h,
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
                          'Upload file',
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
                        height: 50.h,
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
                adjustHieght(50.h),
                EventButton(
                  color: neonShadeLinearGradient,
                  text: 'Submit',
                  textColr: kwhite,
                  onTap: () {
                    showReportSuccessDialog(context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
