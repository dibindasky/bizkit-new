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
        ProgressIndicatorWidget(
            text: 'Others to Self',
            centerPercentage: 88,
            outerPercentage1: 30,
            outerPercentage2: 30,
            outerPercentage3: 28,
            onTap: () {
              homeController.changeSelectedTaskCategory('Others to self');
              Get.toNamed(Routes.taskLists, id: 1);
            }),
        ProgressIndicatorWidget(
          text: 'Self to Others',
          centerPercentage: 78,
          outerPercentage1: 20,
          outerPercentage2: 30,
          outerPercentage3: 28,
          onTap: () {
            homeController.changeSelectedTaskCategory('Self to Others');
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
        ProgressIndicatorWidget(
          text: 'Self to Self',
          centerPercentage: 65,
          outerPercentage1: 20,
          outerPercentage2: 25,
          outerPercentage3: 20,
          onTap: () {
            homeController.changeSelectedTaskCategory('Self to Self');
            Get.toNamed(Routes.taskLists, id: 1);
          },
        ),
      ],
    );
  }
}

class ProgressIndicatorWidget extends StatefulWidget {
  final double centerPercentage;
  final double outerPercentage1;
  final double outerPercentage2;
  final double outerPercentage3;
  final String text;
  final VoidCallback onTap;

  const ProgressIndicatorWidget(
      {super.key, required this.centerPercentage,
      required this.outerPercentage1,
      required this.outerPercentage2,
      required this.outerPercentage3,
      required this.text,
      required this.onTap});

  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationCenter;
  late Animation<double> _animationOuter1;
  late Animation<double> _animationOuter2;
  late Animation<double> _animationOuter3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animationCenter =
        Tween<double>(begin: 0, end: widget.centerPercentage / 100)
            .animate(_controller);
    _animationOuter1 =
        Tween<double>(begin: 0, end: widget.outerPercentage1 / 100)
            .animate(_controller);
    _animationOuter2 =
        Tween<double>(begin: 0, end: widget.outerPercentage2 / 100)
            .animate(_controller);
    _animationOuter3 =
        Tween<double>(begin: 0, end: widget.outerPercentage3 / 100)
            .animate(_controller);

    // _controller.forward();
    animate();
  }

  animate() async {
    await Future.delayed(Duration(seconds: 2));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 3 - 60;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration:
          BoxDecoration(color: kGrayLight, borderRadius: kBorderRadius15),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(width, width),
                      painter: OuterBorderPainter(10),
                    ),
                    CustomPaint(
                      size: Size(width, width),
                      painter: OuterProgressPainter(_animationOuter1.value,
                          _animationOuter2.value, _animationOuter3.value),
                    ),
                    CustomPaint(
                      size: Size(width - 20, width - 20),
                      painter: CenterProgressPainter(_animationCenter.value),
                    ),
                    Text(
                      '${(_animationCenter.value * 100).toInt()} %',
                      style: textStyle1.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
            adjustHieght(10.h),
            Text(widget.text)
          ],
        ),
      ),
    );
  }
}

class CenterProgressPainter extends CustomPainter {
  final double progress;

  CenterProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = neonShade
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    double radius = size.width / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    canvas.drawArc(
        rect, -0.5 * 3.14, progress * 2 * 3.14, false, paint); // Start from top
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class OuterBorderPainter extends CustomPainter {
  OuterBorderPainter(this.progress);
  final double progress;
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = kblack
      ..strokeWidth =
          9 // Slightly thicker to make sure it appears under the progress
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    double radius = size.width / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    canvas.drawArc(rect, -0.5 * progress, 2 * 3.14, false, borderPaint);
    canvas.drawArc(rect, -0.2 * progress, 2 * 3.14, false, borderPaint);
    canvas.drawArc(rect, 0.1 * progress, 2 * 3.14, false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class OuterProgressPainter extends CustomPainter {
  final double progress1;
  final double progress2;
  final double progress3;

  OuterProgressPainter(this.progress1, this.progress2, this.progress3);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = kred
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Paint paint2 = Paint()
      ..color = kOrange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Paint paint3 = Paint()
      ..color = kblue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    double radius = size.width / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    double startAngle1 = -0.5 * 3.14;
    double sweepAngle1 = progress1 * 2 * 3.14;

    double startAngle2 = startAngle1 + sweepAngle1;
    double sweepAngle2 = progress2 * 2 * 3.14;

    double startAngle3 = startAngle2 + sweepAngle2;
    double sweepAngle3 = progress3 * 2 * 3.14;

    canvas.drawArc(rect, startAngle1, sweepAngle1, false, paint1);
    canvas.drawArc(rect, startAngle2, sweepAngle2, false, paint2);
    canvas.drawArc(rect, startAngle3, sweepAngle3, false, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}