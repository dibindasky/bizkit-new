import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/module/biz_card/application/presentation/screens/pdf/pdf_preview_screen.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/image_viewer.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class TaskDetailAttachmentsSection extends StatelessWidget {
  const TaskDetailAttachmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();

    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: klightDarkGrey,
        borderRadius: kBorderRadius10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Attachments ',
                style: textHeadStyle1.copyWith(fontSize: 13.sp),
              ),
              // Text(
              //   ' (Images,Pdf)',
              //   style: textThinStyle1.copyWith(fontSize: 8.sp),
              // ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          Obx(
            () {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: 30.h,
                  child: ShimmerLoader(
                    height: 30.h,
                    itemCount: 5,
                    width: 80.w,
                    scrollDirection: Axis.horizontal,
                    seprator: const SizedBox(
                      width: 8,
                    ),
                  ),
                );
              } else if (controller.singleTask.value.attachments == null ||
                  controller.singleTask.value.attachments!.isEmpty) {
                return Center(
                  child: Text(
                    'No Attachments Available',
                    style: textThinStyle1.copyWith(
                        color: klightgrey, fontSize: 12.sp),
                  ),
                );
              } else {
                return SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: controller.singleTask.value.attachments?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final attachment =
                          (controller.singleTask.value.attachments)
                              ?.reversed
                              .toList()[index];
                      return GestureDetector(
                        onTap: () {
                          // log('Attachment Type ==== > ${attachment?.type}');
                          _handleAttachmentTap(
                            context,
                            attachment?.attachment ?? '',
                            attachment?.type ?? '',
                            controller,
                            index,
                          );
                        },
                        child: AttachmentTile(
                          // file: attachment.
                          attachmet: attachment?.attachment ?? 'No Attachment',
                          type: attachment?.type ?? 'Unknown Type',
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _handleAttachmentTap(BuildContext context, String attachment,
      String type, CreateTaskController controller, int index) {
    // Filter out non-image attachments
    final imageAttachments = controller.singleTask.value.attachments
            ?.where((att) =>
                att.type == 'jpg' || att.type == 'png' || att.type == 'image')
            .toList() ??
        [];
    if (type == 'jpg' || type == 'png' || type == 'image') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewScreen(
            initialIndex: index,
            attachments: imageAttachments,
            imageBase64: attachment,
          ),
        ),
      );
    } else if (type == 'pdf') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenPdfPreview(
            base64: attachment,
            label: 'Attachment',
          ),
        ),
      );
    } else {
      // Handle other types if needed
    }
  }
}

class AttachmentTile extends StatelessWidget {
  const AttachmentTile({
    super.key,
    required this.attachmet,
    required this.type,
  });
  final String attachmet;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration:
          BoxDecoration(borderRadius: kBorderRadius15, color: lightColr),
      // padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == 'pdf'
              ? Expanded(
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius15,
                  ),
                  child: PdfViewer.openData(
                    base64Decode(attachmet.startsWith('data')
                        ? attachmet
                            .substring('data:application/pdf;base64,'.length)
                        : attachmet),
                    onError: (_) => const Center(
                      child: Text('Could not load document please try again'),
                    ),
                  ),
                ))
              : Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 35.w,
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius15,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(base64Decode(attachmet)))),
                  ),
                ),
          // Text(
          //   '.$type',
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   style: textThinStyle1.copyWith(fontSize: 10.sp),
          // ),
        ],
      ),
    );
  }
}
