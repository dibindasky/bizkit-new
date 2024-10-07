import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskSearchScreen extends StatelessWidget {
  const TaskSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(id: 1);
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Hero(
                tag: 'taskSearch',
                child: TaskTextField(
                  // showBorder: true,
                  controller: taskController.taskSearchController,
                  // fillColor: textFieldFillColr,
                  onChanged: (value) {
                    taskController.searchTasks();
                  },
                  onTapOutside: () => FocusScope.of(context).unfocus(),
                  hintText: 'Find your task',
                  suffixIcon: const Icon(Icons.search, color: neonShade),
                ),
              ),
              adjustHieght(15.h),
              Expanded(
                child: Obx(
                  () {
                    if (taskController.taskSearchLoading.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child:ShimmerLoaderTaskContainer(
              height: 50.h,
              itemCount: 10,
              width: double.infinity,
            ),
                      );
                    } else if (taskController.tasksSearch.isEmpty) {
                      return ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No Tasks',
                        onRefresh: () {},
                      );
                    } else {
                      return ListView.builder(
                        controller: taskController.taskSearchScrollController,
                        itemCount: taskController.tasksSearch.length +
                            (taskController.taskSearchLoadMoreLoading.value
                                ? 1
                                : 0),
                        itemBuilder: (context, index) {
                          if (index == taskController.tasksSearch.length &&
                              taskController.taskSearchLoadMoreLoading.value) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: ShimmerLoaderTaskContainer(
              height: 50.h,
              itemCount: 1,
              width: double.infinity,
            ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                taskController.fetchSingleTask(
                                  singleTaskModel: GetSingleTaskModel(
                                      taskId: taskController
                                              .tasksSearch[index].id ??
                                          ''),
                                );
                                GoRouter.of(context).pushNamed(
                                  Routes.taskDeail,
                                  pathParameters: {
                                    "taskId":
                                        taskController.tasksSearch[index].id ??
                                            ''
                                  },
                                );
                              },
                              child: TaskContainer(
                                index: index,
                                typeTask: taskController.tasksSearch[index],
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
