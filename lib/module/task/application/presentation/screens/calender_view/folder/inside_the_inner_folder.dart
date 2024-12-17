import 'dart:developer';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskInsideTheInnerFolderScreen extends StatelessWidget {
  const TaskInsideTheInnerFolderScreen({super.key, this.arguments});
  final Map<String, dynamic>? arguments;

  @override
  Widget build(BuildContext context) {
    final folderController = Get.find<TaskFolderController>();
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    adjustWidth(20.w),
                    Text(
                      arguments?['innerFolderName'],
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              adjustHieght(10),
              if (folderController.getFoldersLoading.value)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: ShimmerLoaderTaskContainer(
                      height: 50.h,
                      itemCount: 10,
                      width: double.infinity,
                    ),
                  ),
                )
              else if (!internetConnectinController
                      .isConnectedToInternet.value &&
                  folderController.tasksInsideInnerFolder.isEmpty)
                Expanded(
                    child: SizedBox(
                        width: 300.w,
                        child: InternetConnectionLostWidget(
                          onTap: () {
                            folderController.fetchAllTasksInsideAInnerFolder(
                              InnerFolderTasksGetParamsModel(
                                folderId: arguments?['folderId'],
                                innerFolderId: arguments?['innerFolderId'],
                              ),
                            );
                          },
                        )))
              else if (folderController.tasksInsideInnerFolder.isEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: ErrorRefreshIndicator(
                      image: emptyNodata2,
                      errorMessage:
                          'The folder "${arguments?['innerFolderName']}" has no tasks yet!',
                      onRefresh: () {
                        folderController.fetchAllTasksInsideAInnerFolder(
                          InnerFolderTasksGetParamsModel(
                            folderId: arguments?['folderId'],
                            innerFolderId: arguments?['innerFolderId'],
                          ),
                        );
                      },
                    ),
                  ),
                )
              else
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      folderController.fetchAllTasksInsideAInnerFolder(
                        InnerFolderTasksGetParamsModel(
                          folderId: arguments?['folderId'],
                          innerFolderId: arguments?['innerFolderId'],
                        ),
                      );
                    },
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
                              taskController.fetchSingleTask(
                                  singleTaskModel: GetSingleTaskModel(
                                      taskId: folderController
                                              .tasksInsideInnerFolder[index]
                                              .taskId ??
                                          ''));

                              GoRouter.of(context).pushNamed(
                                Routes.taskDeail,
                                pathParameters: {
                                  "taskId": folderController
                                          .tasksInsideInnerFolder[index]
                                          .taskId ??
                                      ''
                                },
                              );
                            },
                            child: TaskContainer(
                              fromInnerfolder: true,
                              fromFolders: true,
                              tasksFromInnerFolder: true,
                              folderId: arguments?['folderId'],
                              innerFolderId: arguments?['innerFolderId'],
                              isInnerFolderTask: true,
                              index: index,
                              tasksInsideInnerFolder: folderController
                                  .tasksInsideInnerFolder[index],
                            ),
                          ),
                        );
                      },
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
