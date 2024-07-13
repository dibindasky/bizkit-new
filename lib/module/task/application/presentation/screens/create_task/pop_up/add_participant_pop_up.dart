import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddParticipentBottomSheet extends StatelessWidget {
  const AddParticipentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final TextEditingController searchController = TextEditingController();
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: 500.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          kHeight20,
          Text('Add Participants', style: fontPopinsMedium),
          Divider(
            color: lightGrey,
          ),
          TaskTextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  taskController.searchParticipants(
                    user: UserSearchModel(searchTerm: value),
                  );
                }
              },
              controller: searchController,
              hintText: 'Find your task',
              showBorder: true,
              fillColor: textFieldFillColr,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: neonShade))),
          adjustHieght(20.h),
          Expanded(child: Obx(
            () {
              if (taskController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (taskController.userslist.isEmpty) {
                return const Center(child: Text('No participants found.'));
              } else {
                return ListView.separated(
                  itemCount: taskController.userslist.length,
                  separatorBuilder: (context, index) => Divider(
                    endIndent: 30.w,
                    indent: 50.w,
                    height: 0,
                    color: kgrey,
                    thickness: 0,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(imageDummyAsset),
                    ),
                    title:
                        Text(taskController.userslist[index].name ?? 'No Name'),
                    subtitle: Text(
                      '${taskController.userslist[index].email ?? 'No Email'} ',
                      style: fontPopinsThin.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        final participant = TaskAssignedTo(
                          user: taskController.userslist[index].name,
                          isAccepted: false,
                        );
                        taskController.participants.add(participant);
                        log("participants => ${taskController.participants.map((e) => e.toJson()).toList()}");
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.w),
                          decoration: BoxDecoration(
                              gradient: neonShadeGradient,
                              //  index % 2 == 0 ? neonShadeGradient : null,
                              borderRadius: kBorderRadius5,
                              border: Border.all(color: neonShade)),
                          child: Text(
                              'Add', // index % 2 == 0 ? 'Remove' : 'Add',
                              style: fontPopinsThin.copyWith(fontSize: 10.sp))),
                    ),
                  ),
                );
              }
            },
          ))
        ]),
      ),
    );
  }
}
