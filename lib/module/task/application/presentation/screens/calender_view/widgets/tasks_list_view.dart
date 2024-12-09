// import 'dart:developer';

// import 'package:bizkit/core/routes/routes.dart';
// import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
// import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
// import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
// import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
// import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
// import 'package:bizkit/utils/constants/constant.dart';
// import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
// import 'package:bizkit/utils/shimmer/shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// class TaskListView extends StatelessWidget {
//   TaskListView({super.key});
//   final controller = Get.find<TaskCalenderViewController>();
//   final taskController = Get.find<CreateTaskController>();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         if (taskController.taksListLoading.value) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: ShimmerLoaderTaskContainer(
//               height: 50.h,
//               itemCount: 10,
//               width: double.infinity,
//             ),
//           );
//         } else if (taskController.deadlineTasks.isEmpty) {
//           return ErrorRefreshIndicator(
//             shrinkWrap: true,
//             image: emptyNodata2,
//             errorMessage: 'No tasks available',
//             onRefresh: () {},
//           );
//         } else {
//           return ListView.builder(
//             controller: taskController.deadlineTasksScrollController,
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             itemCount: taskController.deadlineTasks.length +
//                 (taskController.deadlineTasksLoadMoreLoading.value ? 1 : 0),
//             // itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               // final task = tasks[index];
//               // final deadlineTask = taskController.deadlineTasks[index];
//               // final typeTask = taskController.typeTasks[index];

//               if (index == taskController.deadlineTasks.length &&
//                   taskController.deadlineTasksLoadMoreLoading.value) {
//                 return ShimmerLoaderTaskContainer(
//                   height: 50.h,
//                   itemCount: 1,
//                   width: double.infinity,
//                 );
//               } else {
//                 return GestureDetector(
//                   onLongPress: () {
//                     controller.longPress(index);
//                   },
//                   onTap: () {
//                     if (controller.selectedFolderContainer.value) {
//                       controller.longPress(index);
//                     } else {
//                       // log('id : ${deadlineTask.id}');
//                       taskController.fetchSingleTask(
//                         singleTaskModel: GetSingleTaskModel(
//                             taskId: taskController.deadlineTasks[index].id),
//                       );
//                       if (taskController.deadlineTasks[index].isOwned ==
//                           false) {
//                         // taskController.spotLightTask(
//                         //     spotLightTask: SpotLightTask(
//                         //         spotLightStatus: false,
//                         //         taskId:
//                         //             taskController.deadlineTasks[index].id));
//                       }
//                       GoRouter.of(context).pushNamed(
//                         Routes.taskDeail,
//                         pathParameters: {
//                           "taskId": '${taskController.deadlineTasks[index].id}'
//                         },
//                       );
//                     }
//                   },
//                   child: TaskContainer(
//                     tasksFromTasksList: true,
//                     fromFolders: false,
//                     tasksFromFoldrs: false,
//                     tasksFromInnerFolder: false,
//                     typeTask: taskController.deadlineTasks[index],
//                     index: index,
//                   ),
//                 );
//               }
//             },
//           );
//         }
//       },
//     );
//   }
// }

// import 'package:bizkit/core/routes/routes.dart';
// import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
// import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
// import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
// import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
// import 'package:bizkit/utils/constants/constant.dart';
// import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
// import 'package:bizkit/utils/shimmer/shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class TaskListView extends StatefulWidget {
//   const TaskListView({super.key});

//   @override
//   State<TaskListView> createState() => _TaskListViewState();
// }

// class _TaskListViewState extends State<TaskListView> {
//   final controller = Get.find<TaskCalenderViewController>();
//   final taskController = Get.find<CreateTaskController>();

//   @override
//   void initState() {
//     super.initState();
//     _initializeData();
//     _setupScrollController();
//   }

//   Future<void> _initializeData() async {
//     taskController.taskFilterByDeadline();
//   }

//   void _setupScrollController() {
//     taskController.deadlineTasksScrollController.addListener(() {
//       if (_isScrolledToBottom()) {
//         _handleLoadMore();
//       }
//     });
//   }

//   bool _isScrolledToBottom() {
//     final scrollController = taskController.deadlineTasksScrollController;
//     return scrollController.position.pixels >=
//         scrollController.position.maxScrollExtent - 200;
//   }

//   Future<void> _handleLoadMore() async {
//     if (!taskController.deadlineTasksLoadMoreLoading.value) {
//       await taskController.taskFilterByDeadlineLoadMore();
//     }
//   }

//   Future<void> _handleRefresh() async {
//     taskController.taskFilterByDeadline();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
// bizcard
//       () => RefreshIndicator(
//         onRefresh: _handleRefresh,
//         child: _buildContent(),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     if (taskController.taksListLoading.value) {
//       return _buildShimmerLoader();
//     } else if (taskController.deadlineTasks.isEmpty) {
//       return _buildEmptyState();
//     } else {
//       return _buildTaskList();
//     }
//   }

//   Widget _buildShimmerLoader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: ShimmerLoaderTaskContainer(
//         height: 50.h,
//         itemCount: 10,
//         width: double.infinity,
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return ErrorRefreshIndicator(
//       shrinkWrap: true,
//       image: emptyNodata2,
//       errorMessage: 'No tasks available',
//       onRefresh: _handleRefresh,
//     );
//   }

//   Widget _buildTaskList() {
//     return ListView.builder(
//       controller: taskController.deadlineTasksScrollController,
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       itemCount: taskController.deadlineTasks.length +
//           (taskController.deadlineTasksLoadMoreLoading.value ? 1 : 0),
//       itemBuilder: (context, index) {
//         if (_isLoadingMoreItem(index)) {
//           return _buildLoadMoreLoader();

//       () {
//         if (taskController.taksListLoading.value) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: ShimmerLoaderTaskContainer(
//               height: 50.h,
//               itemCount: 10,
//               width: double.infinity,
//             ),
//           );
//         } else if (taskController.deadlineTasks.isEmpty) {
//           return ErrorRefreshIndicator(
//             shrinkWrap: true,
//             image: emptyNodata2,
//             errorMessage: 'No tasks available',
//             onRefresh: () {},
//           );
//         } else {
//           return ListView.builder(
//             controller: taskController.deadlineTasksScrollController,
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             itemCount: taskController.deadlineTasks.length +
//                 (taskController.deadlineTasksLoadMoreLoading.value ? 1 : 0),
//             // itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               // final task = tasks[index];
//               // final deadlineTask = taskController.deadlineTasks[index];
//               // final typeTask = taskController.typeTasks[index];

//               if (index == taskController.deadlineTasks.length &&
//                   taskController.deadlineTasksLoadMoreLoading.value) {
//                 return ShimmerLoaderTaskContainer(
//                   height: 50.h,
//                   itemCount: 1,
//                   width: double.infinity,
//                 );
//               } else {
//                 return GestureDetector(
//                   onLongPress: () {
//                     controller.longPress(index);
//                   },
//                   onTap: () {
//                     if (controller.selectedFolderContainer.value) {
//                       controller.longPress(index);
//                     } else {
//                       // log('id : ${deadlineTask.id}');
//                       taskController.fetchSingleTask(
//                         singleTaskModel: GetSingleTaskModel(
//                             taskId: taskController.deadlineTasks[index].id),
//                       );
//                       if (taskController.deadlineTasks[index].isOwned ==
//                           false) {
//                         // taskController.spotLightTask(
//                         //     spotLightTask: SpotLightTask(
//                         //         spotLightStatus: false,
//                         //         taskId:
//                         //         taskController.deadlineTasks[index].id));
//                       }
//                       GoRouter.of(context).pushNamed(
//                         Routes.taskDeail,
//                         pathParameters: {
//                           "taskId": '${taskController.deadlineTasks[index].id}'
//                         },
//                       );
//                     }
//                   },
//                   child: TaskContainer(
//                     tasksFromTasksList: true,
//                     fromFolders: false,
//                     tasksFromFoldrs: false,
//                     tasksFromInnerFolder: false,
//                     typeTask: taskController.deadlineTasks[index],
//                     index: index,
//                   ),
//                 );
//               }
//             },
//           );
//         }
//         return _buildTaskItem(index);
//       },);

//   }

//   bool _isLoadingMoreItem(int index) {
//     return index == taskController.deadlineTasks.length &&
//         taskController.deadlineTasksLoadMoreLoading.value;
//   }

//   Widget _buildLoadMoreLoader() {
//     return ShimmerLoaderTaskContainer(
//       height: 50.h,
//       itemCount: 1,
//       width: double.infinity,
//     );
//   }

//   Widget _buildTaskItem(int index) {
//     final task = taskController.deadlineTasks[index];

//     return GestureDetector(
//       onLongPress: () => controller.longPress(index),
//       onTap: () => _handleTaskTap(task, index),
//       child: TaskContainer(
//         tasksFromTasksList: true,
//         fromFolders: false,
//         tasksFromFoldrs: false,
//         tasksFromInnerFolder: false,
//         typeTask: task,
//         index: index,
//       ),
//     );
//   }

//   void _handleTaskTap(dynamic task, int index) {
//     if (controller.selectedFolderContainer.value) {
//       controller.longPress(index);
//     } else {
//       taskController.fetchSingleTask(
//         singleTaskModel: GetSingleTaskModel(taskId: task.id),
//       );

//       if (task.isOwned == false) {
//         // Handle non-owned task logic here if needed
//       }

//       GoRouter.of(context).pushNamed(
//         Routes.taskDeail,
//         pathParameters: {"taskId": '${task.id}'},
//       );
//     }
//   }

//   @override
//   void dispose() {
//     taskController.deadlineTasksScrollController.dispose();
//     super.dispose();
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  void initState() {
    super.initState();
    _initializeData();
    _setupScrollController();
  }

  Future<void> _initializeData() async {
    taskController.taskFilterByDeadline();
  }

  void _setupScrollController() {
    taskController.deadlineTasksScrollController.addListener(() {
      if (_isScrolledToBottom()) {
        _handleLoadMore();
      }
    });
  }

  bool _isScrolledToBottom() {
    final scrollController = taskController.deadlineTasksScrollController;
    return scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200;
  }

  Future<void> _handleLoadMore() async {
    if (!taskController.deadlineTasksLoadMoreLoading.value) {
      await taskController.taskFilterByDeadlineLoadMore();
    }
  }

  Future<void> _handleRefresh() async {
    taskController.taskFilterByDeadline();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: _handleRefresh,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (taskController.taksListLoading.value) {
      return _buildShimmerLoader();
    } else if (taskController.deadlineTasks.isEmpty) {
      return _buildEmptyState();
    } else {
      return _buildTaskList();
    }
  }

  Widget _buildShimmerLoader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ShimmerLoaderTaskContainer(
        height: 50.h,
        itemCount: 10,
        width: double.infinity,
      ),
    );
  }

  Widget _buildEmptyState() {
    return ErrorRefreshIndicator(
      shrinkWrap: true,
      image: emptyNodata2,
      errorMessage: 'No tasks available',
      onRefresh: _handleRefresh,
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      controller: taskController.deadlineTasksScrollController,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: taskController.deadlineTasks.length +
          (taskController.deadlineTasksLoadMoreLoading.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isLoadingMoreItem(index)) {
          return _buildLoadMoreLoader();
        }
        return _buildTaskItem(index);
      },
    );
  }

  bool _isLoadingMoreItem(int index) {
    return index == taskController.deadlineTasks.length &&
        taskController.deadlineTasksLoadMoreLoading.value;
  }

  Widget _buildLoadMoreLoader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ShimmerLoaderTaskContainer(
        height: 50.h,
        itemCount: 1,
        width: double.infinity,
      ),
    );
  }

  Widget _buildTaskItem(int index) {
    final task = taskController.deadlineTasks[index];

    return GestureDetector(
      // onLongPress: () => controller.longPress(index),
      onTap: () => _handleTaskTap(task, index),
      child: FadeIn(
        animate: true,
        child: TaskContainer(
          tasksFromTasksList: true,
          fromFolders: false,
          tasksFromFoldrs: false,
          tasksFromInnerFolder: false,
          typeTask: task,
          index: index,
        ),
      ),
    );
  }

  void _handleTaskTap(dynamic task, int index) {
    if (controller.selectedFolderContainer.value) {
      // controller.longPress(index);
    } else {
      taskController.fetchSingleTask(
        singleTaskModel: GetSingleTaskModel(taskId: task.id),
      );

      if (task.isOwned == false) {
        // taskController.spotLightTask(
        //     spotLightTask: SpotLightTask(
        //         spotLightStatus: false,
        //         taskId:
        //             taskController.deadlineTasks[index].id));
      }

      GoRouter.of(context).pushNamed(
        Routes.taskDeail,
        pathParameters: {"taskId": '${task.id}'},
      );
    }
  }
}
