import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenModuleSelector extends StatelessWidget {
  ScreenModuleSelector({super.key});

  final List<ListItemData> listItems = [
    ListItemData(
        color: neonShadeGradientTopToBottom,
        height: 200.h,
        imageUrl: 'https://via.placeholder.com/50',
        title: 'Biz Card',
        subtitle:
            'We believe development must be an enjoyable, creative experience to be truly fulfilling',
        module: Module.card),
    ListItemData(
        color: whiteShadeGradient,
        height: 170.h,
        imageUrl: 'https://via.placeholder.com/50',
        title: 'Task',
        subtitle:
            'We believe development must be an enjoyable, creative experience to be truly fulfilling',
        module: Module.task),
    ListItemData(
        color: blackShadeGradient,
        height: 180.h,
        imageUrl: 'https://via.placeholder.com/50',
        title: 'Attendance',
        subtitle:
            'We believe development must be an enjoyable, creative experience to be truly fulfilling',
        module: Module.attendance),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: MasonryGridView.count(
          itemCount: listItems.length,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return ListItem(item: listItems[index]);
          },
        ),
      ),
    );
  }
}

class ListItemData {
  final Gradient color;
  final double height;
  final String imageUrl;
  final String title;
  final String subtitle;
  final Module module;

  ListItemData({
    required this.color,
    required this.height,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.module,
  });
}

class ListItem extends StatelessWidget {
  final ListItemData item;

  const ListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ModuleController>();
    return GestureDetector(
      onTap: () {
        controller.chooseModule(context, module: item.module);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width) / 3.h,
        height: item.height,
        margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.h),
        padding: EdgeInsets.all(8.0.h),
        decoration: BoxDecoration(
          gradient: item.color,
          borderRadius: BorderRadius.circular(8.0.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(item.imageUrl, height: 50.h),
            SizedBox(height: 8.h),
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: item.color == whiteShadeGradient ? kblack : kwhite),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              item.subtitle,
              style: TextStyle(
                  fontSize: 9.sp,
                  color:
                      item.color == whiteShadeGradient ? kblack : klightgrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
