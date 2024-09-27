import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/swaping_success_dialog.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/leaves/widgets/leave_success_dialog.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmployeeLeaveView extends StatelessWidget {
  // final String? dateTime;
  const EmployeeLeaveView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back(id: 22);
          },
        ),
        title: Text(
          'Calendar',
          style: textThinStyle1.copyWith(fontSize: 16),
        ),
        backgroundColor: kblack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '09 June 2024',
              style: textHeadStyle1.copyWith(fontSize: 20),
            ),
            adjustHieght(10.h),
            Container(
              width: 350.w,
              decoration: BoxDecoration(
                  borderRadius: kBorderRadius15, color: lightColr),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Regional Holiday',
                      style: textThinStyle1.copyWith(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    adjustHieght(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 13,
                              backgroundColor: lightColr,
                              backgroundImage:
                                  AssetImage(demoPerosnImgPeltandpell),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Adam',
                                style: textThinStyle1.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showSwapLeaveDialog(context: context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: lightColr,
                            radius: 13,
                            backgroundImage: AssetImage(swapLeaveImage),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: klightDarkGrey,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
