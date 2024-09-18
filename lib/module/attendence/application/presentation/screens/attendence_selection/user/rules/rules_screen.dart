import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttendenceRulesScreen extends StatelessWidget {
  const AttendenceRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back(id: 22);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        'Rules',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              adjustHieght(15.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  height: 50.h,
                  child: Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Chip(
                            labelStyle: textThinStyle1,
                            side: BorderSide.none,
                            backgroundColor:
                                index == 0 ? neonShade : klightDarkGrey,
                            label: const Text('General'),
                            labelPadding: EdgeInsets.symmetric(horizontal: 26),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => kWidth10,
                        itemCount: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
