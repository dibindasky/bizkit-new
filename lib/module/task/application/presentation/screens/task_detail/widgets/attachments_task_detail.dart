import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/image_viewer.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

class TaskDetailAttachmentsSection extends StatelessWidget {
  const TaskDetailAttachmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();

    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
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
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
                const Spacer(),
                Obx(() => controller.selectedAttachment.value
                    ? GestureDetector(
                        onTap: () {
                          controller.deleteAttachments(context);
                        },
                        child: controller.attachmentDeleteLoading.value
                            ? const SizedBox(
                                height: 20,
                                width: 50,
                                child: LoadingAnimation())
                            : Text(
                                'Delete',
                                style: Theme.of(context).textTheme.displaySmall,
                              ))
                    : const Text('')),

                // Text(
                //   ' (Images,Pdf)',
                //   style: textThinStyle1.copyWith(fontSize: 8.sp),
                // ),
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
                    child: Text('No Attachments Available',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 11,
                                  color: kGreyNormal,
                                )),
                  );
                } else {
                  final listAttachment =
                      (controller.singleTask.value.attachments)
                          ?.reversed
                          .toList();
                  return SizedBox(
                    height: 90,
                    child: ListView.builder(
                      itemCount: listAttachment?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final attachment = listAttachment?[index];

                        return GestureDetector(
                          onTap: () {
                            if (controller
                                .selectedAttachmentsDatas.isNotEmpty) {
                              controller.longPressOrOnTap(
                                  attachment?.attachment ?? '');
                            } else {
                              _handleAttachmentTap(
                                context,
                                attachment?.attachment ?? '',
                                attachment?.type ?? '',
                                controller,
                                index,
                              );
                            }
                            // log('Attachment Type ==== > ${attachment?.type}');
                          },
                          onLongPress: () {
                            controller
                                .longPressOrOnTap(attachment?.attachment ?? '');
                          },
                          child: GetBuilder<CreateTaskController>(
                              id: attachment?.attachment,
                              builder: (_) => AttachmentTile(
                                    isSelected: controller
                                        .selectedAttachmentsDatas
                                        .contains(attachment?.attachment ?? ''),
                                    // file: attachment.
                                    attachmet: attachment?.attachment ??
                                        'No Attachment',
                                    type: attachment?.type ?? 'Unknown Type',
                                  )),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleAttachmentTap(BuildContext context, String attachment,
      String type, CreateTaskController controller, int index) {
    //  Filter out non-image attachments
    final imageAttachments = controller.singleTask.value.attachments
            ?.where((att) => att.type == 'jpg' || att.type == 'png' || att.type == 'image')
            .toList()
            .reversed
            .toList() ??
        [];

    final imageIndex = (imageAttachments.reversed.toList()).indexWhere(
      (element) => controller.singleTask.value.attachments?[index] == element,
    );
    if (type == 'image' || type == 'png') {
      GoRouter.of(context).pushNamed(Routes.slidablePhotoGallery, extra: {
        'images': imageAttachments
            .map(
              (e) => e.attachment!,
            )
            .toList(),
        'memory': false,
        'initial': imageIndex
      });
    } else if (type == 'pdf') {
      // log('PDF URL: $attachment');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            primary: true,
            appBar: AppBar(
              surfaceTintColor: knill,
              title: Text(
                'PDF Viewer',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 19),
              ),
            ),
            body: SfPdfViewer.network(
              attachment,
              key: _pdfViewerKey,
            ),
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
    required this.isSelected,
    super.key,
    required this.attachmet,
    required this.type,
  });
  final String attachmet;
  final String type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius15,
                        color: kblack,
                      ),
                      child: const Icon(
                        Icons.picture_as_pdf,
                        color: kwhite,
                      ),
                    ))
                  : Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius15,
                        ),
                        child: NetworkImageWithLoader(
                          attachmet,
                          radius: 10,
                        ),
                      ),
                    ),
            ],
          ),
        ),
        isSelected
            ? const Center(
                child: Icon(
                Icons.check,
                size: 50,
              ))
            : kempty
      ],
    );
  }
}
