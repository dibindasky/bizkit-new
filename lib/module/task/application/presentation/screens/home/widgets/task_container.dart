import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class TaskContainers extends StatelessWidget {
  const TaskContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TaskProgress(
          title: 'Others to self',
          progress: 100,
          onTap: () {
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
        TaskProgress(
          title: 'Self to Others',
          progress: 100,
          onTap: () {
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
        TaskProgress(
          title: 'Self to Self',
          progress: 100,
          onTap: () {
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
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation =
        Tween<double>(begin: 0, end: widget.progress / 100).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                CircularProgressIndicator(
                  strokeAlign: 6,
                  value: _animation.value,
                  backgroundColor: klightgrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(neonShade),
                  strokeWidth: 6,
                ),
                CircularProgressIndicator(
                  strokeAlign: 3,
                  value: _animation.value,
                  backgroundColor: klightgrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(neonShade),
                  strokeWidth: 6,
                ),
                Text('${widget.progress} %'),
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
