import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
          Text('Add Participants', style: fontPopinsMedium),
          kHeight5,
          Divider(color: lightGrey),
          kHeight10,
          TaskTextField(
            onTapOutside: () => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              if (value.isNotEmpty) {
                taskController.searchParticipants(
                  user: UserSearchModel(searchTerm: value),
                );
              } else {
                taskController.searchParticipants(
                  user: UserSearchModel(searchTerm: value),
                );
              }
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
              builder: (controller) {
                if (controller.searchLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.userslist.isEmpty) {
                  return const Center(child: Text('No participants found.'));
                } else {
                  return ListView.separated(
                    itemCount: controller.userslist.length,
                    separatorBuilder: (context, index) => Divider(
                      endIndent: 30.w,
                      indent: 50.w,
                      height: 0,
                      color: kgrey,
                      thickness: 0,
                    ),
                    itemBuilder: (context, index) {
                      final user = controller.userslist[index];
                      final isAlreadyAdded = controller.userslistNew.any(
                          (participant) => participant.userId == user.userId);

                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(imageDummyAsset),
                        ),
                        title: Text(user.name ?? 'No Name'),
                        subtitle: Text(
                          '${user.email ?? 'No Email'} ',
                          style: fontPopinsThin.copyWith(
                            fontSize: 10.sp,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (isAlreadyAdded) {
                              controller.userslistNew.removeWhere(
                                  (participant) =>
                                      participant.userId == user.userId);
                            } else {
                              final participant = UserSearchSuccessResponce(
                                name: user.name,
                                userId: user.userId,
                                // isAccepted: 'pending',
                              );

                              controller.userslistNew.add(participant);
                            }

                            taskController.update();
                            // log('controller.participants  ${taskController.participants.map(
                            //       (element) => element.name,
                            //     ).join(
                            //       ', ',
                            //     )}');
                            log('Participants: ${taskController.participants.map((e) => e.user).join(', ')}');
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
                              style: fontPopinsThin.copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      );
                    },
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
