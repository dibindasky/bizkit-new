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
    // _initializeData();
    _setupScrollController();
  }

  // Future<void> _initializeData() async {
  //   taskController.taskFilterByDeadline();
  // }

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
    await taskController.taskFilterByDeadline();
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
      child: !taskController.getNetworkLoading.value
          ? FadeInUp(
              animate: true,
              child: TaskContainer(
                tasksFromTasksList: true,
                fromFolders: false,
                tasksFromFoldrs: false,
                tasksFromInnerFolder: false,
                typeTask: task,
                index: index,
              ),
            )
          : FadeIn(
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
