import 'dart:developer';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskInsideTheInnerFolderScreen extends StatelessWidget {
  const TaskInsideTheInnerFolderScreen({super.key, this.arguments});
  final Map<String, dynamic>? arguments;
  @override
  Widget build(BuildContext context) {
    log('Arguments => : $arguments');

    final folderController = Get.find<TaskFolderController>();
    final taskController = Get.find<CreateTaskController>();

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                    ),
                  ),
                  adjustWidth(20),
                  Text(
                    arguments?['innerFolderName'],
                    style: textHeadStyle1.copyWith(fontSize: 18),
                  ),
                ],
              ),
              adjustHieght(10),
              if (folderController.isLoading.value)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (folderController.tasksInsideInnerFolder.isEmpty)
                Expanded(
                  child: ErrorRefreshIndicator(
                    image: emptyNodata2,
                    errorMessage: 'No Tasks',
                    onRefresh: () {
                      folderController.fetchAllTasksInsideAInnerFolder(
                        InnerFolderTasksGetParamsModel(
                          folderId: arguments?['folderId'],
                          innerFolderId: arguments?['innerFolderId'],
                        ),
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    itemCount: folderController.tasksInsideInnerFolder.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          log('Task from inner folder ==> ${folderController.tasksInsideInnerFolder[index].taskId}');
                        },
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(Routes.taskChatScreen);
                            taskController.fetchSingleTask(
                                singleTaskModel: GetSingleTaskModel(
                                    taskId: folderController
                                            .tasksInsideInnerFolder[index]
                                            .taskId ??
                                        ''));
                          },
                          child: TaskContainer(
                            fromInnerfolder: true,
                            fromFolders: true,
                            tasksFromInnerFolder: true,
                            folderId: arguments?['folderId'],
                            innerFolderId: arguments?['innerFolderId'],
                            isInnerFolderTask: true,
                            index: index,
                            tasksInsideInnerFolder:
                                folderController.tasksInsideInnerFolder[index],
                          ),
                        ),
                      );
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
