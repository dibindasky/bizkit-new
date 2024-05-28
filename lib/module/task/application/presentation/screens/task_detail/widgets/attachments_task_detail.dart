import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskDetailAttachmentsSection extends StatelessWidget {
  const TaskDetailAttachmentsSection({super.key});

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
              Text(
                'Attachments',
                style: textHeadStyle1,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(Routes.taskAttachmetnsList);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: const ColoredBox(
                        color: neonShade,
                        child: Icon(Icons.arrow_forward, color: kGrayLight))),
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const AttachmentTile(),
            ),
          )
        ],
      ),
    );
  }
}

class AttachmentTile extends StatelessWidget {
  const AttachmentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration:
          BoxDecoration(borderRadius: kBorderRadius10, color: lightColr),
      padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf_rounded, color: neonShade, size: 35.w),
          adjustHieght(4.h),
          Text(
            'Flow.pdf',
            style: textThinStyle1,
          ),
        ],
      ),
    );
  }
}
