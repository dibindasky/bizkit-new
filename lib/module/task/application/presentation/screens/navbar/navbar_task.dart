import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenNavbarTaskModule extends StatefulWidget {
  const ScreenNavbarTaskModule({super.key});

  @override
  State<ScreenNavbarTaskModule> createState() => _ScreenNavbarTaskModuleState();
}

class _ScreenNavbarTaskModuleState extends State<ScreenNavbarTaskModule> {
  List<Widget> taskBottomItems = [
     ScreenModuleSelector(),
     ScreenModuleSelector(),
     ScreenModuleSelector(),
     ScreenModuleSelector()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Stack(
            children: [
              // Column(
              //   children: [
              // choose body based on selected tab
              // Expanded(
              //   child:
              taskBottomItems[
                  Get.find<TaskNavbarController>().taskBottomIndex.value],
              //   ),
              //   adjustHieght(70.h)
              // ],
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.w),
                        topRight: Radius.circular(40.w)),
                    color: smallBigGrey,
                  ),
                  width: double.infinity,
                  height: 80.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomBarItem(index: 0, image: iconModuleSelectorBottomBar),
                      BottomBarItem(index: 1, image: iconHomeBottomBar),
                      BottomBarItem(index: 2, image: iconHomeBottomBar),
                      BottomBarItem(index: 3, image: iconHomeBottomBar),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.index,
    required this.image,
  });

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        Get.find<TaskNavbarController>().taskBottomIndex.value;

    return GestureDetector(
      onTap: () => Get.find<TaskNavbarController>().changeBottomIndex(index),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: index == selectedIndex ? neonShade : knill,
            borderRadius: BorderRadius.all(Radius.circular(100.w))),
        duration: const Duration(milliseconds: 300),
        height: selectedIndex == index ? 50.w : 40.h,
        width: selectedIndex == index ? 50.w : 40.h,
        padding: EdgeInsets.all(selectedIndex == index ? 5.w : 3.h),
        child: FittedBox(child: Image.asset(image)),
      ),
    );
  }
}
