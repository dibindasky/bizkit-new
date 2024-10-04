import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddParticipentBottomSheet extends StatelessWidget {
  const AddParticipentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final TextEditingController searchController = TextEditingController();

    return Container(
      height: 500.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add Participants', style: fontPopinsMedium),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close_outlined))
            ],
          ),
          kHeight5,
          Divider(color: lightGrey),
          kHeight10,
          TaskTextField(
            onTapOutside: () => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              taskController.searchParticipants();
            },
            controller: searchController,
            hintText: 'Find your Participant',
            showBorder: true,
            fillColor: textFieldFillColr,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: neonShade),
            ),
          ),
          adjustHieght(20.h),
          Expanded(
            child: GetBuilder<CreateTaskController>(
              id: 'searchUser',
              builder: (controller) {
                if (controller.searchLoading.value) {
                  return ShimmerLoaderSearchParticipants(
                      seprator: kHeight5,
                      itemCount: 5,
                      height: 50.h,
                      width: double.infinity);
                } else if (controller.userslist.isEmpty) {
                  return const Center(child: Text('No participants found.'));
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          controller: controller.searchScrollController,
                          itemCount: controller.userslist.length +
                              (taskController.searchLoadMoreLoading.value
                                  ? 1
                                  : 0),
                          separatorBuilder: (context, index) => Divider(
                            endIndent: 30.w,
                            indent: 50.w,
                            height: 0,
                            color: kgrey,
                            thickness: 0,
                          ),
                          itemBuilder: (context, index) {
                            if (index == taskController.userslist.length &&
                                taskController.searchLoadMoreLoading.value) {
                              return ShimmerLoaderSearchParticipants(
                                seprator: kHeight10,
                                itemCount: 1,
                                height: 50.h,
                                width: 200.w,
                              );
                            } else {
                              final user = controller.userslist[index];
                              final isAlreadyAdded = controller.userslistNew
                                  .any((participant) =>
                                      participant.userId == user.userId);

                              return ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: AssetImage(personDemoImg),
                                ),
                                title: Text(
                                  user.name ?? 'No Name',
                                  style: textThinStyle1.copyWith(fontSize: 14),
                                ),
                                subtitle: Text(
                                  maskEmail(user.email ?? ''),
                                  style: fontPopinsThin.copyWith(
                                    fontSize: 10.sp,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    if (isAlreadyAdded) {
                                      controller.userslistNew.removeWhere(
                                          (participant) =>
                                              participant.userId ==
                                              user.userId);
                                    } else {
                                      final participant =
                                          UserSearchSuccessResponce(
                                        name: user.name,
                                        userId: user.userId,
                                        // isAccepted: 'pending',
                                      );

                                      controller.userslistNew.add(participant);
                                    }

                                    taskController.update(['searchUser']);
                                    log('Participants  ${taskController.userslistNew.map(
                                          (element) => element.name,
                                        ).join(
                                          ', ',
                                        )}');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 5.w),
                                    decoration: BoxDecoration(
                                      gradient: neonShadeGradient,
                                      borderRadius: kBorderRadius5,
                                      border: Border.all(color: neonShade),
                                    ),
                                    child: Text(
                                      isAlreadyAdded ? 'Remove' : 'Add',
                                      style: fontPopinsThin.copyWith(
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
