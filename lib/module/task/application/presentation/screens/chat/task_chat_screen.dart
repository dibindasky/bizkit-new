import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bizkit/utils/constants/colors.dart';

class ScreenTaskChat extends StatelessWidget {
  const ScreenTaskChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(Routes.taskDeail);
          },
          child: Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(imageDummyAsset)),
              adjustWidth(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task Name', style: textHeadStyle1),
                  Text('Tap here for more info',
                      style: textStyle1.copyWith(color: kgrey))
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline, color: neonShade)),
          adjustWidth(10.w)
        ],
      ),
    );
  }
}
