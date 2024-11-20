import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TagsContainer extends StatelessWidget {
  TagsContainer({
    super.key,
    this.tagsForEdit = false,
  });

  // final List<String>? tags;
  final TextEditingController tagController = TextEditingController();
  final CreateTaskController controller = Get.find<CreateTaskController>();
  final bool tagsForEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        kHeight10,
        Card(
          elevation: 0,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: kBorderRadius15),
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                    placeholder: 'Add your tags',
                    placeholderStyle: Theme.of(context).textTheme.displaySmall,
                    suffix: GestureDetector(
                      onTap: () {
                        if (tagsForEdit) {
                          final tag = tagController.text.trim();

                          if (tag.isNotEmpty &&
                              !controller.tagsForEdit.contains(tag)) {
                            controller.tagsForEdit.add(tag);
                            // FocusScope.of(context).unfocus();
                            log('Tags For Edit =====> ${controller.tagsForEdit}');
                          }
                          tagController.clear();
                        } else {
                          final tag = tagController.text.trim();

                          if (tag.isNotEmpty &&
                              !controller.tags.contains(tag)) {
                            controller.tags.add(tag);
                            // FocusScope.of(context).unfocus();
                            log('Tags =====> ${controller.tags}');
                          }
                          tagController.clear();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.add, color: kneon),
                      ),
                    ),
                    controller: tagController,
                    style: Theme.of(context).textTheme.displaySmall,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: kneon,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                adjustHieght(5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Obx(() {
                    return Wrap(
                      spacing: 18.0,
                      runSpacing: 4.0,
                      children: tagsForEdit
                          ? controller.tagsForEdit.asMap().entries.map((entry) {
                              int index = entry.key;
                              String tag = entry.value;
                              return Chip(
                                label: Text(
                                  tag,
                                  style: const TextStyle(
                                    color: kwhite,
                                  ),
                                ),
                                onDeleted: () {
                                  controller.removeTagForEdit(tag);
                                  log('Tags For Edit =====> ${controller.tagsForEdit}');
                                },
                                side: BorderSide.none,
                                backgroundColor: controller.tagColor[
                                        index % controller.tagColor.length]
                                    .withOpacity(0.4),
                              );
                            }).toList()
                          : controller.tags.asMap().entries.map((entry) {
                              int index = entry.key;
                              String tag = entry.value;
                              return Chip(
                                label: Text(
                                  tag,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: controller.tagColor[index %
                                              controller.tagColor.length]),
                                ),
                                onDeleted: () {
                                  controller.removeTag(tag);
                                  log('Tags =====> ${controller.tags}');
                                },
                                side: BorderSide.none,
                                backgroundColor: controller.tagColor[
                                        index % controller.tagColor.length]
                                    .withOpacity(0.05),
                              );
                            }).toList(),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
