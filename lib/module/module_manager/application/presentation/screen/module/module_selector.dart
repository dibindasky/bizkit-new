import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenModuleSelector extends StatelessWidget {
  ScreenModuleSelector({super.key});

  final List<_ListItemData> listItems = [
    _ListItemData(
        color: neonShadeGradientTopToBottom,
        height: 120.h,
        imageUrl: image,
        title: 'Biz Card',
        subtitle:
            'We believe development must be an enjoyable, creative experience to be truly fulfilling',
        module: Module.card),
    // _ListItemData(
    //     color: whiteShadeGradient,
    //     height: 170.h,
    //     imageUrl: flutterIcon,
    //     title: 'Task',
    //     subtitle:
    //         'We believe development must be an enjoyable, creative experience to be truly fulfilling',
    //     module: Module.task),
    // _ListItemData(
    //     color: blackShadeGradient,
    //     height: 210.h,
    //     imageUrl: 'https://via.placeholder.com/50',
    //     title: 'Attendance',
    //     subtitle:
    //         'We believe development must be an enjoyable, creative experience to be truly fulfilling',
    //     module: Module.attendance),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.h),
          // child: MasonryGridView.count(
          //   itemCount: listItems.length,
          //   crossAxisCount: 3,
          //   mainAxisSpacing: 4,
          //   crossAxisSpacing: 4,
          //   itemBuilder: (context, index) {
          //     return ListItem(item: listItems[index]);
          //   },
          // ),

          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => kHeight10,
            itemCount: listItems.length,
            // padding: const EdgeInsets.only(top: 10, bottom: 60),
            itemBuilder: (context, index) {
              return ListItem(item: listItems[index]);
            },
          ),
        ),
      ),
    );
  }
}

class _ListItemData {
  final Gradient color;
  final double height;
  final String imageUrl;
  final String title;
  final String subtitle;
  final Module module;

  _ListItemData({
    required this.color,
    required this.height,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.module,
  });
}

class ListItem extends StatelessWidget {
  final _ListItemData item;

  const ListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ModuleController>();
    // return GestureDetector(
    //   onTap: () {
    //     controller.chooseModule(context, module: item.module);
    //   },
    //   child: Container(
    //     width: (MediaQuery.of(context).size.width) / 3.h,
    //     height: item.height,
    //     margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.h),
    //     padding: EdgeInsets.all(8.0.h),
    //     decoration: BoxDecoration(
    //       gradient: item.color,
    //       borderRadius: BorderRadius.circular(8.0.h),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.network(item.imageUrl, height: 50.h),
    //         SizedBox(height: 8.h),
    //         Text(
    //           item.title,
    //           style: TextStyle(
    //               fontSize: 16.sp,
    //               color: item.color == whiteShadeGradient ? kblack : kwhite),
    //           textAlign: TextAlign.center,
    //         ),
    //         SizedBox(height: 4.h),
    //         Text(
    //           item.subtitle,
    //           style: TextStyle(
    //               fontSize: 9.sp,
    //               color:
    //                   item.color == whiteShadeGradient ? kblack : klightgrey),
    //           textAlign: TextAlign.center,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: () {
        controller.chooseModule(context, module: item.module);
      },
      // child: Container(
      //   width: (MediaQuery.of(context).size.width) / 3.h,
      //   height: item.height,
      //   margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.h),
      //   padding: EdgeInsets.all(8.0.h),
      //   decoration: BoxDecoration(
      //     gradient: item.color,
      //     borderRadius: BorderRadius.circular(8.0.h),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.network(item.imageUrl, height: 50.h),
      //       SizedBox(height: 8.h),
      //       Text(
      //         item.title,
      //         style: TextStyle(
      //             fontSize: 16.sp,
      //             color: item.color == whiteShadeGradient ? kblack : kwhite),
      //         textAlign: TextAlign.center,
      //       ),
      //       SizedBox(height: 4.h),
      //       Text(
      //         item.subtitle,
      //         style: TextStyle(
      //             fontSize: 9.sp,
      //             color:
      //                 item.color == whiteShadeGradient ? kblack : klightgrey),
      //         textAlign: TextAlign.center,
      //       ),
      //     ],
      //   ),
      // ),
      child: Container(
        height: item.height,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
        decoration: BoxDecoration(
          gradient: item.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
            child: ListTile(
              tileColor: kGreyNormal.withOpacity(0.1),
              leading: Container(
                width: 55.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kblack.withOpacity(0.2),
                ),
                child: const Icon(Icons.logo_dev, color: Colors.white),
              ),
              // leading: Image.network(item.imageUrl, height: 40.h),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 19,
                    color: item.color == whiteShadeGradient ? kblack : kwhite),
              ),
              subtitle: Text(
                item.subtitle,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 12,
                      color: item.color == whiteShadeGradient
                          ? kblack
                          : klightgrey,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
