import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/legends_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_creation_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTaskHome extends StatelessWidget {
  const ScreenTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 24),
          child: ListView(
            children: [
              const TaskHomeAppBar(),
              adjustHieght(16.h),
              const TaskTextField(
                hintText: 'Find your task',
                suffixIcon: Icon(Icons.search, color: neonShade),
              ),
              adjustHieght(16.h),
              const TaskCreationContainer(),
              adjustHieght(16.h),
              const LegendsContainer(),
              adjustHieght(40.h),
              TaskContainers(),
              adjustHieght(70.h),
              Center(
                child: EventButton(
                  hieght: 40.h,
                  wdth: 200.w,
                  text: 'Generate Report',
                  textColr: kblack,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      showDragHandle: true,
                      isScrollControlled: true,
                      backgroundColor: backgroundColour,
                      builder: (BuildContext context) {
                        return const ScreenTaskReportGenerator();
                      },
                    );
                  },
                  color: const LinearGradient(
                    colors: [neonShade, neonShade],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}