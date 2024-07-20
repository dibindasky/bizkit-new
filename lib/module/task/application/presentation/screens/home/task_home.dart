// import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/legends_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_creation_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
// import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
// import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTaskHome extends StatelessWidget {
  const ScreenTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<TaskHomeScreenController>();
    // final taskController = Get.find<CreateTaskController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // taskController.filterByType(
      //     filterByType: FilterByTypeModel(taskType: 'all'));

      // taskController.filterPinnedTasksByType(
      //     filterPinnedTask: FilterPinnedTaskByTypeModel(
      //   taskType: 'all',
      //   isPinned: true,
      // ));
      // homeController.progresBar();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 24),
          child: ListView(
            children: [
              const TaskHomeAppBar(),
              adjustHieght(16.h),
              const TaskTextField(
                hintText: 'Find your task',
                suffixIcon: Icon(Icons.search, color: neonShade),
              ),
              adjustHieght(16.h),
              const TaskCreationContainer(),
              adjustHieght(16.h),
              const LegendsContainer(),
              adjustHieght(40.h),
              TaskContainers(),
              adjustHieght(70.h),
              Center(
                child: EventButton(
                  hieght: 40.h,
                  wdth: 200.w,
                  text: 'Generate Report',
                  textColr: kblack,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      showDragHandle: true,
                      isScrollControlled: true,
                      backgroundColor: backgroundColour,
                      builder: (BuildContext context) {
                        return const ScreenTaskReportGenerator();
                      },
                    );
                  },
                  color: const LinearGradient(
                    colors: [neonShade, neonShade],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
