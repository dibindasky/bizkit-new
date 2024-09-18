import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/routes/routes.dart';
import 'widgets/pelt_and_pell_appbar.dart';
import 'widgets/pelt_and_pell_card.dart';

class AttendencePeltAndPellScreen extends StatelessWidget {
  const AttendencePeltAndPellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
            child: Column(
              children: [
                AttendencePeltAndPellAppbar(
                  title: 'PELT & PELL',
                  onPressed: () {
                    Get.toNamed(Routes.attendenceSelectionManagementSide,
                        id: 22);
                  },
                ),
                adjustHieght(10.h),
                SizedBox(
                  height: khieght * .7,
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          const AttendencePeltAndPellCard(),
                      separatorBuilder: (context, index) => kHeight10,
                      itemCount: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
