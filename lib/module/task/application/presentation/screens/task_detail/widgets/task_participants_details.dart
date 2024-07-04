import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetailUserInfoSection extends StatelessWidget {
  const TaskDetailUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: kGrayLight,
        borderRadius: kBorderRadius10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: neonShade,
                child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: CircleAvatar(
                      radius: 20.w,
                      backgroundImage: const AssetImage(imageDummyAsset),
                    )),
              ),
              adjustWidth(7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assigned By',
                    style: textThinStyle1,
                  ),
                  Text(
                    'Melissa Burnedead',
                    style: textHeadStyle1,
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: neonShade,
                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: const CircleAvatar(
                      backgroundColor: kgrey,
                      child: Icon(Icons.calendar_month, color: kwhite)),
                ),
              ),
              adjustWidth(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deadline',
                    style: textThinStyle1,
                  ),
                  Text(
                    'May 20',
                    style: textHeadStyle1,
                  ),
                ],
              ),
            ],
          ),
          adjustHieght(10.h),
          Row(
            children: [
              CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: const CircleAvatar(
                      backgroundColor: kgrey,
                      child: Icon(
                        Icons.person,
                        color: neonShade,
                      )),
                ),
              ),
              adjustWidth(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participants',
                    style: textThinStyle1,
                  ),
                  Text(
                    'Stephen, Joseph, Christopher, . . .',
                    style: textStyle1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
