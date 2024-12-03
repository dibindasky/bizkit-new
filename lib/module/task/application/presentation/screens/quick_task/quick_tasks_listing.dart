import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/quick_tasks_app_bar.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/quick_tasks_tab_bar.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/quick_tasks_tab_view_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuickTasksListingScreen extends StatefulWidget {
  const QuickTasksListingScreen({super.key});

  @override
  State<QuickTasksListingScreen> createState() =>
      _QuickTasksListingScreenState();
}

class _QuickTasksListingScreenState extends State<QuickTasksListingScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const QuickTasksAppBar(),
            adjustHieght(20.h),
            QuickTasksTabBar(tabController: tabController),
            QuickTasksTabViewSection(
              tabController: tabController,
              taskController: taskController,
            ),
          ],
        ),
      )),
    );
  }
}
