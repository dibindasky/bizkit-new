import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/pelt&pell/widgets/pelt_and_pell_appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttendenceMsChangePeltAndPellView extends StatefulWidget {
  const AttendenceMsChangePeltAndPellView({super.key});

  @override
  State<AttendenceMsChangePeltAndPellView> createState() =>
      _AttendenceMsChangePeltAndPellViewState();
}

class _AttendenceMsChangePeltAndPellViewState
    extends State<AttendenceMsChangePeltAndPellView> {
  String? departmentType;
  String? selectEmployee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              const AttendenceMsPeltAndPellAppbar(
                title: 'PELT&PELL',
                fromChangePeltAndPell: true,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: klightDarkGrey,
                        deleteIconColor: neonShade,
                        side: BorderSide.none,
                        onDeleted: () {},
                        label: Text(
                          selectEmployee ?? 'Select Employee',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    items: <String>[
                      'Dibin',
                      'Athul',
                      'Febin',
                      'Abhijith',
                      'Arun',
                      'vishnu',
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
                        selectEmployee = value;
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
                      hintText: 'Reason for change in PELT',
                      hintStyle: TextStyle(
                        color: kwhite,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(15.h),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
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
                        Text('PELT change from'),
                        Icon(Icons.calendar_month_sharp),
                      ],
                    ),
                  ),
                ),
              ),
              adjustHieght(15.h),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
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
                        Text('PELL change from'),
                        Icon(Icons.calendar_month_sharp),
                      ],
                    ),
                  ),
                ),
              ),
              adjustHieght(30.h),
              EventButton(
                color: neonShadeLinearGradient,
                text: 'Change PELT',
                onTap: () {
                  Get.back(id: 22);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
