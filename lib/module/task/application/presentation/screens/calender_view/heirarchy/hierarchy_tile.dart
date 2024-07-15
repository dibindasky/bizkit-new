import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HierarchyListtile extends StatelessWidget {
  const HierarchyListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.heirarchyUserDetail, id: 2);
        // GoRouter.of(context).pushNamed(Routes.heirarchyUserDetail);
      },
      child: ListTile(
        leading: const CustomStackOnlineDotCircleAvatar(
          image: dummyPersonImage,
          dotColor: neonShade,
          backgroundColor: knill,
        ),
        title: Row(
          children: [
            const Text('Addam smith'),
            adjustWidth(50),
            Text(
              '12 Tasks',
              style: TextStyle(
                color: Color(int.parse('0xFFFF6006')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenHeirarchyTaskUserDetails extends StatelessWidget {
  ScreenHeirarchyTaskUserDetails({super.key});
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskCalenderViewController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            adjustHieght(10),
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
                CustomStackOnlineDotCircleAvatar(
                  image: dummyPersonImage,
                  dotColor: knill,
                  backgroundColor: lightGrey,
                ),
                adjustWidth(20),
                const Text('Addam Smith'),
                const Spacer(),
                CustomCircleAvatar(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const Scaffold(
                          body: Column(
                            children: [],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: lightGrey,
                  backgroundColorInner: lightGrey,
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: neonShade,
                  ),
                ),
                adjustWidth(10),
              ],
            ),
            adjustHieght(10),
            EasyDateTimeLine(
              timeLineProps: const EasyTimeLineProps(
                vPadding: 20,
                hPadding: 15,
              ),
              headerProps: const EasyHeaderProps(
                showSelectedDate: false,
                showHeader: false,
              ),
              activeColor: neonShade,
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {},
            ),
            adjustHieght(10),
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (controller.taskInSideAFolder.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text('No Tasks'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      // itemCount: tasks.length,
                      itemCount: controller.taskInSideAFolder.length,
                      itemBuilder: (context, index) {
                        final task = controller.taskInSideAFolder[index];
                        // final task = tasks[index];
                        return TaskContainer(
                          index: index, tasksInsideAFolder: task,
                          // task: task,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
