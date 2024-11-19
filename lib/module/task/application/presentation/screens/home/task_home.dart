import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/generate_report_button.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/recent_tasks_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                TaskHomeAppBar(authController: authController),
                adjustHieght(25.h),
                TaskStatusSection(tabController: tabController),
                adjustHieght(15.h),
                const RecentTasksSection(),
                adjustHieght(30.h),
                const GenerateReportButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
