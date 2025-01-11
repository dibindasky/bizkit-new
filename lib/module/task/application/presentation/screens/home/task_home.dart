import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/generate_report_button.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/recent_tasks_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

// Updated enum with center positions
enum ButtonPosition {
  topLeft,
  topRight,
  centerLeft,
  centerRight,
  bottomLeft,
  bottomRight
}

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  ButtonPosition currentPosition = ButtonPosition.bottomRight;

  // Updated position calculator
  Offset getButtonPosition(Size screenSize) {
    switch (currentPosition) {
      case ButtonPosition.topLeft:
        return const Offset(0, 10);
      case ButtonPosition.topRight:
        return Offset(screenSize.width - 90, 10);
      case ButtonPosition.centerLeft:
        return Offset(0, (screenSize.height - 60) / 2);
      case ButtonPosition.centerRight:
        return Offset(screenSize.width - 90, (screenSize.height - 60) / 2);
      case ButtonPosition.bottomLeft:
        return Offset(0, screenSize.height * 0.8 - 10);
      case ButtonPosition.bottomRight:
        return Offset(screenSize.width - 90, screenSize.height * 0.8 - 10);
    }
  }

  // Updated direction calculator
  SpeedDialDirection getDialDirection() {
    switch (currentPosition) {
      case ButtonPosition.topLeft:
        return SpeedDialDirection.down;
      case ButtonPosition.centerLeft:
      case ButtonPosition.bottomLeft:
        return SpeedDialDirection.up; // Dial opens to the right
      case ButtonPosition.topRight:
        return SpeedDialDirection.down; // Dial opens downward
      case ButtonPosition.centerRight:
      case ButtonPosition.bottomRight:
        return SpeedDialDirection.up; // Dial opens upward
      default:
        return SpeedDialDirection.up; // Default direction
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homeController = Get.find<TaskHomeScreenController>();
    final messageCoutController = Get.find<MessageCountController>();
    final authController = Get.find<AuthenticationController>();

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
                        adjustHieght(60.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: getButtonPosition(screenSize).dx,
              top: getButtonPosition(screenSize).dy,
              child: Draggable(
                feedback: _buildFloatingButton(),
                childWhenDragging: Container(),
                hitTestBehavior: HitTestBehavior.translucent,
                onDragEnd: (details) {
                  onDragEnd(details, screenSize);
                },
                child: _buildFloatingButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, Size screenSize) {
    setState(() {
      final newPosition = details.offset;
      final verticalSection =
          screenSize.height / 3; // Divide screen into three vertical sections

      // Determine vertical position (top, center, or bottom)
      if (newPosition.dy < verticalSection) {
        // Top third
        currentPosition = newPosition.dx < screenSize.width / 2
            ? ButtonPosition.topLeft
            : ButtonPosition.topRight;
      } else if (newPosition.dy < verticalSection * 2) {
        // Middle third
        currentPosition = newPosition.dx < screenSize.width / 2
            ? ButtonPosition.centerLeft
            : ButtonPosition.centerRight;
      } else {
        // Bottom third
        currentPosition = newPosition.dx < screenSize.width / 2
            ? ButtonPosition.bottomLeft
            : ButtonPosition.bottomRight;
      }
    });
  }

  Widget _buildFloatingButton() {
    final taskController = Get.find<CreateTaskController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SpeedDial(
        icon: Iconsax.flash_15,
        activeIcon: Icons.close,
        iconTheme: IconThemeData(
          color: Get.isDarkMode ? kblack : kneon,
        ),
        switchLabelPosition: currentPosition == ButtonPosition.centerLeft ||
            currentPosition == ButtonPosition.bottomLeft ||
            currentPosition == ButtonPosition.topLeft,
        backgroundColor: Get.isDarkMode ? kneon : kblack,
        overlayColor: Theme.of(context).colorScheme.onSecondary,
        overlayOpacity: 0.5,
        direction: getDialDirection(),
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
            labelBackgroundColor: Theme.of(context).colorScheme.onSecondary,
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
            labelBackgroundColor: Theme.of(context).colorScheme.onSecondary,
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
            labelBackgroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
