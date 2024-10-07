import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/tabbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/completed_tasks_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/custom_pop_menubutton.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/killed_tasks_list.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenTotalTasksScreen extends StatefulWidget {
  const ScreenTotalTasksScreen({super.key});

  @override
  State<ScreenTotalTasksScreen> createState() => _ScreenTotalTasksScreenState();
}

class _ScreenTotalTasksScreenState extends State<ScreenTotalTasksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final homeController = Get.find<TaskHomeScreenController>();
  final taskController = Get.find<CreateTaskController>();
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showCustomMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      color: klightDarkGrey,
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'All Tasks',
            onTap: () {
              homeController.changeSelectedTaskCategory('All');
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                taskType: 'all',
                isPinned: true,
              ));
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(taskType: 'all'));

              taskController.changeFilterTaskType('all');
              log('TASK TYPE === > ${taskController.taskType.value}');

              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to Self',
            onTap: () {
              homeController.changeSelectedTaskCategory('Self to self');
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                taskType: 'self_to_self',
                isPinned: true,
              ));
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(taskType: 'self_to_self'));

              taskController.changeFilterTaskType('self_to_self');
              log('TASK TYPE === > ${taskController.taskType.value}');

              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to others',
            onTap: () {
              homeController.changeSelectedTaskCategory('Self to others');
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                taskType: 'self_to_others',
                isPinned: true,
              ));
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(taskType: 'self_to_others'));

              taskController.changeFilterTaskType('self_to_others');
              log('TASK TYPE === > ${taskController.taskType.value}');

              Navigator.of(context).pop();
              log(homeController.taskCategory.value);
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Others to self',
            onTap: () {
              homeController.changeSelectedTaskCategory('Others to self');
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                taskType: 'others_to_self',
                isPinned: true,
              ));
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(taskType: 'others_to_self'));
              taskController.changeFilterTaskType('others_to_self');
              log('TASK TYPE === > ${taskController.taskType.value}');

              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Completed Tasks',
            onTap: () {
              homeController.changeSelectedTaskCategory('Completed Tasks');
              taskController.fetchAllCompletedTasks();
              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Killed Tasks',
            onTap: () {
              homeController.changeSelectedTaskCategory('Killed Tasks');
              taskController.fetchAllKilledTasks();
              Navigator.of(context).pop();
            },
          ),
        ),
        // PopupMenuItem(
        //   child: CustomPopupMenuItem(
        //     text: 'Combleted task',
        //     onTap: () {
        //       homeController.changeSelectedTaskCategory('Combleted task');
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final taskController = Get.find<CreateTaskController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // taskController.fetchAllPinnedTasks();
      // taskController.filterByType(
      //     filterByType: FilterByTypeModel(taskType: 'self_to_self'));
    });
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 17,
            ),
          ),
          backgroundColor: knill,
          title: GetBuilder<TaskHomeScreenController>(builder: (controller) {
            return GestureDetector(
              onTap: () => _showCustomMenu(context),
              child: Row(
                children: [
                  Text(
                    controller.taskCategory.value.replaceAll('_', ' '),
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  adjustWidth(10.w),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            );
          }),
          actions: const [
            // IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.filter_list),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.add),
            //   onPressed: () {},
            // ),
          ],
          bottom: homeController.taskCategory.value == 'Completed Tasks' ||
                  homeController.taskCategory.value == 'Killed Tasks'
              ? null
              : PreferredSize(
                  preferredSize: const Size.fromHeight(50.0),
                  child: Stack(
                    children: [
                      TabBar(
                          dividerColor: kblack,
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: neonShade,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          unselectedLabelColor: kwhite,
                          labelColor: kwhite,
                          indicatorColor: knill,
                          tabs: [
                            SizedBox(
                              width: kwidth * 0.5,
                              child: const Tab(text: 'Total Tasks'),
                            ),
                            SizedBox(
                              width: kwidth * 0.5,
                              child: const Tab(text: 'Pinned tasks'),
                            ),
                          ]),
                    ],
                  ),
                ),
        ),
        body: Obx(
          () => homeController.taskCategory.value == 'Completed Tasks'
              ? const CompletedTasksListView()
              : homeController.taskCategory.value == 'Killed Tasks'
                  ? const KilledTasksListView()
                  : GetBuilder<CreateTaskController>(
                      builder: (controller) {
                        return TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            TotalTaskListView(),
                            PinnedTasks(tabController: _tabController),
                          ],
                        );
                      },
                    ),
        ),
      ),
    );
  }
}

class PinnedTasks extends StatelessWidget {
  const PinnedTasks({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    log('${taskController.allPinnedTasks.length}', name: 'Task Controller');
    return Obx(
      () {
        if (taskController.filterByTypeLoading.value ||
            taskController.pinLoader.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (taskController.allPinnedTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No Pinned Tasks',
            onRefresh: () {
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                      taskType: Get.find<TaskHomeScreenController>()
                          .taskCategory
                          .value
                          .replaceAll(' ', '_')
                          .toLowerCase(),
                      isPinned: true));
              taskController.filterByType(
                  filterByType: FilterByTypeModel(
                      taskType: Get.find<TaskHomeScreenController>()
                          .taskCategory
                          .value
                          .replaceAll(' ', '_')
                          .toLowerCase()));
            },
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              taskController.filterPinnedTasksByType(
                  filterPinnedTask: FilterPinnedTaskByTypeModel(
                      taskType: Get.find<TaskHomeScreenController>()
                          .taskCategory
                          .value
                          .replaceAll(' ', '_')
                          .toLowerCase(),
                      isPinned: true));
              taskController.filterByType(
                  filterByType: FilterByTypeModel(
                      taskType: Get.find<TaskHomeScreenController>()
                          .taskCategory
                          .value
                          .replaceAll(' ', '_')
                          .toLowerCase()));
            },
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: taskController.allPinnedTasks.length,
              // itemCount: tasks.length,
              itemBuilder: (context, index) {
                final pinnedTasks = taskController.allPinnedTasks[index];
                return GestureDetector(
                  onLongPress: () {
                    // bool isSelected = !controller.selectedIndices.contains(index);
                    // controller.longPress(isSelected, index);
                  },
                  onTap: () {
                    taskController.fetchSingleTask(
                        singleTaskModel:
                            GetSingleTaskModel(taskId: pinnedTasks.id));
                    // if (controller.selectedFolderContainer.value) {
                    //   bool isSelected = !controller.selectedIndices.contains(index);
                    //   controller.longPress(isSelected, index);
                    // } else {
                    // GoRouter.of(context).push(Routes.taskChatScreen);
                    //}

                    GoRouter.of(context).pushNamed(
                      Routes.taskDeail,
                      pathParameters: {"taskId": '${pinnedTasks.id}'},
                    );
                  },
                  child: TaskContainer(
                    tasksFromFilterSection: true,
                    tabIndex: tabController.index,
                    index: index,
                    typeTask: pinnedTasks,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
