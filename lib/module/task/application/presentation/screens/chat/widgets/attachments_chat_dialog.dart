import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AttachmentsChatDialog extends StatelessWidget {
  const AttachmentsChatDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 70.h,
            left: 20.w,
            child: Container(
              width: 200.h,
              decoration:
                  BoxDecoration(borderRadius: kBorderRadius20, color: kblack),
              padding: EdgeInsets.all(10.w),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                kHeight10,
                AttachmentTile(
                    iconData: Icons.camera_alt_outlined,
                    onTap: () {},
                    text: 'Camera'),
                AttachmentTile(
                    iconData: Icons.photo_size_select_actual_outlined,
                    onTap: () {},
                    text: 'Photo & Video Library'),
                AttachmentTile(
                    iconData: Icons.file_present_outlined,
                    onTap: () {},
                    text: 'Document'),
                AttachmentTile(
                    iconData: Icons.poll_outlined,
                    onTap: () {
                      GoRouter.of(context).pop();
                      GoRouter.of(context)
                          .pushNamed(Routes.taskChatPollCration);
                    },
                    text: 'Poll'),
                AttachmentTile(
                    iconData: Icons.alarm, onTap: () {}, text: 'Update Time'),
                AttachmentTile(
                    iconData: Icons.location_on_outlined,
                    onTap: () {},
                    text: 'Location'),
                // AttachmentTile(
                //     iconData: Icons.contact_page_outlined,
                //     onTap: () {},
                //     text: 'Contact'),
                GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Cancel')),
                kHeight10
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class AttachmentTile extends StatelessWidget {
  const AttachmentTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconData,
  });
  final VoidCallback onTap;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: knill,
        child: Column(
          children: [
            Row(
              children: [
                Icon(iconData, color: neonShade),
                kWidth10,
                Text(text, style: textStyle1)
              ],
            ),
            const Divider(color: klightgrey, thickness: 0)
          ],
        ),
      ),
    );
  }
}