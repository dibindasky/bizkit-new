import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LevelSharingAppBar extends StatelessWidget {
  const LevelSharingAppBar({
    super.key,
    required this.isCommonLevelSharing,
  });

  final bool isCommonLevelSharing;

  @override
  build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 19,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
              adjustWidth(20.w),
              Text(
                isCommonLevelSharing
                    ? 'Common Level Sharing'
                    : 'Card Level Sharing',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          if (!isCommonLevelSharing)
            IconButton(
                onPressed: () {
                  levelSharingController.fetchAllCommonSharedFields();
                  GoRouter.of(context)
                      .pushNamed(Routes.levelSharingSettings, extra: {
                    "isCommonLevelSharing": true,
                  });
                },
                icon: Icon(
                  Icons.read_more,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 36,
                ))
        ],
      ),
    );
  }
}
