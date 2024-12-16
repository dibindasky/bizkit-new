import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
// import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/generate_report_button.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/recent_tasks_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  Offset buttonPosition = const Offset(
    260, // Default X position (near the bottom-right corner)
    620, // Default Y position (top half of the screen)
  );

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final homeController = Get.find<TaskHomeScreenController>();
    final messageCoutController = Get.find<MessageCountController>();
    final authController = Get.find<AuthenticationController>();
    // final internetConnectinController =
    //     Get.find<InternetConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      messageCoutController.sendReqForUnread();
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                homeController.progresBar();
                messageCoutController.sendReqForUnread();
                await homeController.fetchRecentTasks();
              },
              child: FadeIn(
                animate: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        TaskHomeAppBar(authController: authController),
                        adjustHieght(25.h),
                        TaskStatusSection(tabController: tabController),
                        adjustHieght(1.h),
                        const RecentTasksSection(),
                        adjustHieght(30.h),
                        const GenerateReportButton(),
                        adjustHieght(60.h)
                        // internetConnectinController.isConnectedToInternet.value
                        //     ? adjustHieght(60.h)
                        //     : adjustHieght(100.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy,
              child: Draggable(
                feedback: _buildFloatingButton(),
                childWhenDragging: Container(), // Hide button while dragging
                onDragEnd: (details) {
                  onDragEnd(details, screenHeight, context);
                },
                child: _buildFloatingButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDragEnd(
      DraggableDetails details, double screenHeight, BuildContext context) {
    setState(() {
      final newPosition = details.offset;
      final screenWidth = MediaQuery.of(context).size.width;

      const double minHeight = 0; // Top of the screen
      final double maxHeight =
          screenHeight * 0.8; // Limit for the button's Y-axis

      // Determine whether to snap to the left or right based on the X position
      final bool snapToLeft = newPosition.dx < screenWidth / 3;

      buttonPosition = Offset(
        snapToLeft ? 0 : screenWidth - 90, // Snap to left or right
        newPosition.dy.clamp(minHeight, maxHeight - 60), // Constrain Y axis
      );
    });
  }

  Widget _buildFloatingButton() {
    final taskController = Get.find<CreateTaskController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SpinPerfect(
        animate: true,
        child: SpeedDial(
          icon: Iconsax.flash_15,
          activeIcon: Icons.close,
          iconTheme: IconThemeData(
            color: Get.isDarkMode ? kblack : kneon,
          ),
          backgroundColor: Get.isDarkMode ? kneon : kblack,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          direction: SpeedDialDirection.up,
          elevation: 3,
          children: [
            SpeedDialChild(
              child: const Icon(Iconsax.task, color: kwhite),
              label: 'All Quick Tasks',
              labelStyle: Theme.of(context).textTheme.bodySmall,
              onTap: () {
                taskController.fetchAllQuickTasks();
                taskController.fetchCompletedQuickTasks();
                GoRouter.of(context).pushNamed(
                  Routes.quickTasksListing,
                );
              },
              backgroundColor: kblack,
              labelBackgroundColor: kblack,
            ),
            SpeedDialChild(
              child: const Icon(Iconsax.personalcard, color: kwhite),
              label: 'Received Requests ',
              labelStyle: Theme.of(context).textTheme.bodySmall,
              onTap: () {
                taskController.fetchQuickTaskRequests();
                GoRouter.of(context).pushNamed(
                  Routes.quickTaskReceivedRequests,
                );
              },
              backgroundColor: kblack,
              labelBackgroundColor: kblack,
            ),
            SpeedDialChild(
              child: const Icon(Iconsax.additem, color: kwhite),
              label: 'New Quick Task',
              labelStyle: Theme.of(context).textTheme.bodySmall,
              onTap: () {
                GoRouter.of(context).pushNamed(
                  Routes.quickTaskCreateUpdate,
                  extra: {
                    'edit': false,
                  },
                );
              },
              backgroundColor: kblack,
              labelBackgroundColor: kblack,
            ),
          ],
        ),
      ),
    );
  }
}
