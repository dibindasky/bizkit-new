import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/tabbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/custom_pop_menubutton.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
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
      color: lightGrey,
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to Self    ',
            onTap: () {
              homeController.changeSelectedTaskCategory('Self to Self');
              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to others',
            onTap: () {
              homeController.changeSelectedTaskCategory('Self to others');
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
              Navigator.of(context).pop();
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Combleted task',
            onTap: () {
              homeController.changeSelectedTaskCategory('Combleted task');
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.fetchAllPinnedTasks();
    });
    return Scaffold(
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
            child: Obx(
              () => Row(
                children: [
                  Text(
                    controller.taskCategory.value,
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  adjustWidth(10.w),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
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
                    child: const Tab(text: 'Pinned tasks'),
                  ),
                  SizedBox(
                    width: kwidth * 0.5,
                    child: const Tab(text: 'Total Tasks'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const PinnedTasks(),
          TotalTaskListView(),
        ],
      ),
    );
  }
}

class PinnedTasks extends StatelessWidget {
  const PinnedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<TaskCalenderViewController>();
    final taskController = Get.find<CreateTaskController>();
    return Obx(() {
      if (taskController.allPinnedTasks.isEmpty) {
        return const Center(
          child: Text('Pinned Tasks is Empty'),
        );
      } else {
        return ListView.builder(
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
                // if (controller.selectedFolderContainer.value) {
                //   bool isSelected = !controller.selectedIndices.contains(index);
                //   controller.longPress(isSelected, index);
                // } else {
                GoRouter.of(context).push(Routes.taskChatScreen);
                //}
              },
              child: TaskContainer(
                index: index,
                pinnedTasks: pinnedTasks,
              ),
            );
          },
        );
      }
    });
  }
}
