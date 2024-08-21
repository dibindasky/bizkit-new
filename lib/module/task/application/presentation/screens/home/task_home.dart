import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/legends_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_creation_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/tasks_lists.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ScreenTaskHome extends StatelessWidget {
  const ScreenTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();
    final messageCoutController = Get.find<MessageCountController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.progresBar();
      taskController.searchTasks(searchItem: '');
      messageCoutController.sendReqForUnread();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 24),
          child: ListView(
            children: [
              const TaskHomeAppBar(),
              adjustHieght(16.h),
              Hero(
                tag: 'taskSearch',
                child: GestureDetector(
                  onTap: () {
                    taskController.searchTasks(searchItem: '');
                    FocusScope.of(context).unfocus();
                    log('Search bar clicked');
                    Get.toNamed(Routes.taskSearch, id: 1);
                  },
                  child: TaskTextField(
                    showBorder: true,
                    fillColor: textFieldFillColr,
                    enabled: false,
                    onTapOutside: () => FocusScope.of(context).unfocus(),
                    hintText: 'Find your task',
                    suffixIcon: const Icon(Icons.search, color: neonShade),
                  ),
                ),
              ),
              adjustHieght(16.h),
              const TaskCreationContainer(),
              adjustHieght(16.h),
              // const LegendsContainer(),
              const TasksListsWidget(),
              // TaskContainers(),
              adjustHieght(30.h),
              Center(
                child: EventButton(
                  hieght: 40.h,
                  wdth: 270.w,
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
