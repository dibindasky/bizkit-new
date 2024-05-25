import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentChooserTaskCreation extends StatelessWidget {
  const AttachmentChooserTaskCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: TextStyle(
            color: neonShade,
            fontSize: 15.sp,
          ),
        ),
        adjustHieght(10.h),
        Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: kBorderRadius15,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.file_upload_outlined, color: neonShade),
              Text('Browse File or upload')
            ],
          ),
        ),
      ],
    );
  }
}
