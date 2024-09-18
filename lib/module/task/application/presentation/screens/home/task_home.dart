import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_creation_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/tasks_lists.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTaskHome extends StatelessWidget {
  const ScreenTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();
    final messageCoutController = Get.find<MessageCountController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.fetchRecentTasks();

      if (!homeController.progresBarOrRecentTask.value) {
        homeController.progresBar();
      }
      messageCoutController.sendReqForUnread();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 24),
          child: RefreshIndicator(
            onRefresh: () async {
              if (homeController.progresBarOrRecentTask.value) {
                homeController.fetchRecentTasks();
              } else {
                homeController.progresBar();
              }
            },
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
                Obx(() {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: !homeController.progresBarOrRecentTask.value
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: kempty,
                    secondChild: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kHeight20,
                        TaskContainers(),
                      ],
                    ),
                  );
                }),
                adjustHieght(16.h),
                const TasksListsWidget(),
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
      ),
    );
  }
}
