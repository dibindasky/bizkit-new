import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TagsContainer extends StatelessWidget {
  TagsContainer({super.key, this.tags});

  final List? tags;

  final TextEditingController tagController = TextEditingController();
  final controller = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    // Combine the passed tags and the controller's tags
    controller.updatingTags(tags);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tags',
          style: TextStyle(
            fontSize: 16,
            color: neonShade,
          ),
        ),
        kHeight10,
        Container(
          width: double.infinity,
          decoration:
              BoxDecoration(color: lightGrey, borderRadius: kBorderRadius15),
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: 'Add your tags',
                  placeholderStyle: TextStyle(color: kwhite.withOpacity(0.6)),
                  suffix: GestureDetector(
                    onTap: () {
                      controller.addTag(tagController.text.trim());
                      tagController.clear();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.add, color: neonShade),
                    ),
                  ),
                  controller: tagController,
                  style: const TextStyle(color: kwhite),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: neonShade,
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
                    children: controller.combinedTags.map((tag) {
                      int index =
                          controller.combinedTags.toList().indexOf(tag) %
                              controller.tagColor.length;
                      final isSelected = controller.selectedTags.contains(tag);
                      return FilterChip(
                        side: BorderSide.none,
                        label: Text(
                          tag,
                          style: TextStyle(
                            color: isSelected
                                ? kwhite
                                : controller.tagColor[index].withOpacity(0.9),
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (_) => controller.toggleTagSelection(tag),
                        selectedColor: neonShade.withOpacity(0.9),
                        backgroundColor:
                            controller.tagColor[index].withOpacity(0.2),
                        checkmarkColor: kwhite,
                      );
                    }).toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
