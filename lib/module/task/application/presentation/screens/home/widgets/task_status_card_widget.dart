import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/utils/clipper/task_status_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskStatusCardWidget extends StatelessWidget {
  const TaskStatusCardWidget(
      {super.key,
      required this.homeController,
      this.cardTitle,
      this.allTasksCount,
      this.completedTasksCount,
      this.onTap});

  final TaskHomeScreenController homeController;

  final String? cardTitle;
  final int? allTasksCount;
  final int? completedTasksCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final completed = completedTasksCount ?? 0;
    final all = allTasksCount ?? 0;
    final progress = all > 0 ? (completed / all) : 0.0;
    return Column(
      children: [
        adjustHieght(20.h),
        Stack(
          children: [
            // White Border
            ClipPath(
              clipper: TaskStatusClipper(),
              child: Container(
                height: 165.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kwhite,
                ),
              ),
            ),
            // Main Card
            Padding(
              padding: const EdgeInsets.all(4),
              child: ClipPath(
                clipper: TaskStatusClipper(),
                child: Container(
                  width: double.infinity,
                  height: 158.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF59FBFB),
                        Color(0xFF379D98),
                        Color(0xFF59F6FB),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                          animate: true,
                          child: Text(
                            cardTitle ?? 'Card title',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 19,
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        FadeInRight(
                          animate: true,
                          child: Text(
                            '${completedTasksCount ?? 0} / ${allTasksCount ?? 0} Task Completed ',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        FadeInRight(
                          animate: true,
                          child: Text(
                            'Progress',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 13,
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInRight(
                              animate: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: LinearProgressIndicator(
                                  minHeight: 12,
                                  value: progress,
                                  backgroundColor: kwhite.withOpacity(0.3),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    kwhite,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            FadeInRight(
                              animate: true,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${(progress * 100).toInt()}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 13,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: onTap,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.arrow_outward_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
