import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskSearchScreen extends StatelessWidget {
  const TaskSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final TextEditingController searchController = TextEditingController();

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
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Hero(
                tag: 'taskSearch',
                child: TaskTextField(
                  // showBorder: true,
                  controller: searchController,
                  // fillColor: textFieldFillColr,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      taskController.searchTasks(searchItem: value);
                    } else {
                      taskController.searchTasks(searchItem: value);
                    }
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (taskController.tasksSearch.isEmpty) {
                      return ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No Tasks',
                        onRefresh: () {},
                      );
                    } else {
                      return ListView.builder(
                        itemCount: taskController.tasksSearch.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              taskController.fetchSingleTask(
                                singleTaskModel: GetSingleTaskModel(
                                    taskId:
                                        taskController.tasksSearch[index].id ??
                                            ''),
                              );
                              GoRouter.of(context).pushNamed(
                                Routes.taskDeail,
                                pathParameters: {
                                  "taskId":
                                      taskController.tasksSearch[index].id ?? ''
                                },
                              );
                            },
                            child: TaskContainer(
                              index: index,
                              typeTask: taskController.tasksSearch[index],
                            ),
                          );
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
