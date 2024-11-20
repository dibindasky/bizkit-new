import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AttachmentChooserTaskCreation extends StatelessWidget {
  const AttachmentChooserTaskCreation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        adjustHieght(10.h),
        GestureDetector(
          onTap: controller.pickFiles,
          child: Card(
            elevation: 0,
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.file_upload_outlined, color: kneon),
                  adjustWidth(20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Browse File or Upload',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Allowed file types: JPG, PDF',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: kGreyNormal, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Obx(() {
          if (controller.selectedFiles.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                adjustHieght(10.h),
                Text('Selected Files:',
                    style: Theme.of(context).textTheme.displaySmall),
                adjustHieght(10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.selectedFiles
                        .map(
                          (file) => Stack(
                            children: [
                              SizedBox(
                                width: 109.w,
                                height: 60.h,
                                child: Card(
                                  elevation: 0,
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Iconsax.document_copy5,
                                          color: kneon,
                                          size: 30.w,
                                        ),
                                        Text(
                                          file.name,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(fontSize: 9),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: -9,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    controller.selectedFiles.remove(file);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          } else {
            return kempty;
          }
        }),
      ],
    );
  }
}
