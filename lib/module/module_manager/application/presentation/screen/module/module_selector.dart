import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class ScreenModuleSelector extends StatelessWidget {
  ScreenModuleSelector({super.key});

  final List title = [
    'Biz Card',
    'Task',
    'Module 3',
  ];
  final List subtitle = [
    'We belive development must be an enjoyable, creative experiance to be truly fulilling',
    'We belive development must be an enjoyable, creative experiance to be truly fulilling',
    'We belive development must be an enjoyable, creative experiance to be truly fulilling',
  ];
  final List images = [
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50'
  ];
  final List color = [
    neonShadeGradientTopToBottom,
    whiteShadeGradient,
    blackShadeGradient
  ];
  final List height = [200.h, 140.h, 140.h];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          itemCount: title.length,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return ListItem(
                item: ListItemData(
                    color: color[index % 3],
                    height: height[index % 3],
                    imageUrl: images[index % 3],
                    title: title[index % 3],
                    subtitle: subtitle[index % 3]));
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

  ListItemData({
    required this.color,
    required this.height,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class ListItem extends StatelessWidget {
  final ListItemData item;

  const ListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: item.height,
      margin: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 1.0.h),
      padding: EdgeInsets.all(8.0.h),
      decoration: BoxDecoration(
        gradient: item.color,
        borderRadius: BorderRadius.circular(8.0.h),
      ),
      child: Expanded(
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
