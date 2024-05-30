import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskContainers extends StatelessWidget {
  TaskContainers({super.key});
  final homeController = Get.find<TaskHomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TaskProgress(
          title: 'Others to self',
          progress: 100,
          onTap: () {
            homeController.changeSelectedTaskCategory('Others to self');
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
        TaskProgress(
          title: 'Self to Others',
          progress: 100,
          onTap: () {
            homeController.changeSelectedTaskCategory('Self to Others');
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
        TaskProgress(
          title: 'Self to Self',
          progress: 100,
          onTap: () {
            homeController.changeSelectedTaskCategory('Self to Self');
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
      ],
    );
  }
}

class TaskProgress extends StatefulWidget {
  final String title;
  final int progress;
  final VoidCallback onTap;

  const TaskProgress({
    super.key,
    required this.title,
    required this.progress,
    required this.onTap,
  });

  @override
  State<TaskProgress> createState() => _TaskProgressState();
}

class _TaskProgressState extends State<TaskProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.4.w,
        height: 130.h,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius15,
          color: lightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      strokeAlign: 2,
                      value: _animationController.value,
                      backgroundColor: klightgrey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(neonShade),
                      strokeWidth: 6,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      strokeAlign: 6,
                      value: _animationController.value,
                      backgroundColor: klightgrey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(neonShade),
                      strokeWidth: 6,
                    );
                  },
                ),
                Text(
                  '${widget.progress} %',
                  style: TextStyle(fontSize: 8.sp),
                ),
              ],
            ),
            adjustHieght(20.h),
            Text(widget.title),
          ],
        ),
      ),
    );
  }
}
