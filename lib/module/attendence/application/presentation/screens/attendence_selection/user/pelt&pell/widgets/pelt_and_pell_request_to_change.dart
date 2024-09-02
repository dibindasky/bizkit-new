import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/pelt&pell/widgets/pelt_and_pell_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/routes/routes.dart';
import '../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../utils/constants/contants.dart';

class AttendencePPRequestToChangeScreen extends StatelessWidget {
  AttendencePPRequestToChangeScreen({super.key});
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
                AttendencePeltAndPellAppbar(
                  title: 'PELT & PELL Request',
                  onPressed: () {
                    Get.toNamed(Routes.attendencePeltAndPell, id: 22);
                  },
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
                        hintText: 'Reason of PELT request',
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
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true,
                    //   builder: (BuildContext context) {
                    //     return CalendarBottomSheet(
                    //       datePicker: selectDateTextEditingController,
                    //       onPressed: (p0) {},
                    //     );
                    //   },
                    // );
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
                          Text('Request Date Till'),
                          Icon(Icons.calendar_month_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                GestureDetector(
                  onTap: () {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
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
                          Text('PELT'),
                          Icon(Icons.watch_later_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                GestureDetector(
                  onTap: () {},
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
                          Text('PELL'),
                          Icon(Icons.location_on),
                        ],
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
                        height: 50.h,
                        child: const Center(
                          child: Text(
                            'Browse',
                            style: TextStyle(
                              color: kblack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                adjustHieght(55.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back(id: 22);
                        },
                        child: Container(
                          width: 146.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: neonShade),
                            borderRadius: kBorderRadius5,
                          ),
                          child: const Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: neonShade),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 146.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              color: neonShade, borderRadius: kBorderRadius5),
                          child: const Center(
                            child: Text(
                              'Request',
                              style: TextStyle(color: kblack),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
