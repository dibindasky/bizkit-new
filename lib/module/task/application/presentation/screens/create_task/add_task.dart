import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/attachments_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/dropdown_items.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/radio_buttons.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/tag_contaner.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/sub_task_bulder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenAddTask extends StatelessWidget {
  const ScreenAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    final style = TextStyle(
      fontSize: 15.sp,
      color: neonShade,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back(id: 1);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: knill,
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: style),
                adjustHieght(10.h),
                const TaskTextField(hintText: 'Tittle'),
                adjustHieght(10.h),
                Text('Description', style: style),
                adjustHieght(10.h),
                const TaskTextField(maxLines: 5, hintText: 'Description'),
                adjustHieght(15.h),
                Text('Task Type', style: style),
                adjustHieght(15.h),
                const RadioButtons(),
                adjustHieght(20.h),
                const DropDownItems(),
                adjustHieght(20.h),
                Text('Task Head', style: style),
                adjustHieght(10.h),
                const TaskTextField(hintText: 'Task Head'),
                adjustHieght(15.h),
                Text('Assign to', style: style),
                adjustHieght(10.h),
                const TaskTextField(hintText: 'Assign to'),
                DeadlineChooserCreateTask(
                  onPressed: (date) {
                    controller.deadlineDate.value = date;
                  },
                ),
                adjustHieght(20.h),
                const TagsContainer(),
                adjustHieght(20.h),
                const AttachmentChooserTaskCreation(),
                adjustHieght(16.h),
                SubTaskBuilder(),
                adjustHieght(10.h),
                Center(
                    child: EventButton(
                  color: const LinearGradient(colors: [neonShade, neonShade]),
                  wdth: 300.w,
                  text: 'Create Task',
                  onTap: () {},
                )),
                adjustHieght(20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
