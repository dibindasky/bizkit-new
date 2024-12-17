import 'dart:developer';

import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddParticipentBottomSheet extends StatefulWidget {
  const AddParticipentBottomSheet({
    super.key,
  });

  @override
  State<AddParticipentBottomSheet> createState() =>
      _AddParticipentBottomSheetState();
}

class _AddParticipentBottomSheetState extends State<AddParticipentBottomSheet>
    with TickerProviderStateMixin {
  late TabController tabController;
  final taskController = Get.find<CreateTaskController>();
  final accessController = Get.find<AccessController>();
  @override
  void initState() {
    tabController = TabController(
        length: accessController.userRole.value == 'employee' ? 3 : 2,
        vsync: this,
        initialIndex: 0);
    if (tabController.index == 0) {
      taskController.recentlySearched(searchQuery: '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: khieght,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add Participants',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close_outlined))
            ],
          ),
          kHeight10,
          TaskTextField(
            onTapOutside: () => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              if (tabController.index == 0) {
                taskController.recentlySearched(searchQuery: value);
              } else if (tabController.index == 1) {
                taskController.userSearchfilterType.value = 'all';
                taskController.searchUsers(
                  tabController.index,
                );
              } else {
                taskController.userSearchfilterType.value = 'organization';
                taskController.searchUsers(
                  tabController.index,
                );
              }
            },
            controller: taskController.searchController,
            hintText: 'Find your Participant',
            showBorder: true,
            fillColor: textFieldFillColr,
            suffixIcon: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus(); 
              },
              icon: const Icon(Icons.search, color: neonShade),
            ),
          ),
          adjustHieght(10.h),
          TabBar(
            overlayColor: WidgetStateColor.transparent,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            dividerColor: kGreyNormal,
            controller: tabController,
            indicatorWeight: 2,
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            onTap: (value) {
              if (value == 0) {
                taskController.recentlySearched(searchQuery: '');
              } else if (value == 1) {
                taskController.userSearchfilterType.value = 'all';
                taskController.searchUsers(tabController.index);
              } else {
                taskController.userSearchfilterType.value = 'organization';
                taskController.searchUsers(tabController.index);
              }
            },
            tabs: [
              Tab(
                child: Text(
                  'Frequently used',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Tab(
                child: Text(
                  ' All ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              if (accessController.userRole.value == 'employee')
                Tab(
                  child: Text(
                    'organization',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
            ],
          ),
          adjustHieght(20.h),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                GetBuilder<CreateTaskController>(
                  id: 'searchUser',
                  builder: (controller) {
                    if (controller.recentlyUserSearchLoading.value) {
                      return ShimmerLoaderSearchParticipants(
                          seprator: kHeight5,
                          itemCount: 5,
                          height: 50.h,
                          width: double.infinity);
                    } else if (controller.recentlySearcheduserslist.isEmpty) {
                      return Center(
                          child: Text(
                        'No participants found.',
                        style: Theme.of(context).textTheme.displaySmall,
                      ));
                    } else {
                      return ListView.separated(
                        controller: controller.searchScrollController,
                        itemCount: controller.recentlySearcheduserslist.length,
                        separatorBuilder: (context, index) => Divider(
                          endIndent: 30.w,
                          indent: 30.w,
                          height: 0,
                          color: kgrey,
                          thickness: 0,
                        ),
                        itemBuilder: (context, index) {
                          final user =
                              controller.recentlySearcheduserslist[index];
                          final isAlreadyAdded = controller.userslistNew.any(
                              (participant) =>
                                  participant.userId == user.userId);

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage(userProfileDummy),
                              ),
                              title: Text(
                                user.name ?? 'No Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 13),
                              ),
                              subtitle: Text(
                                maskEmail(user.email ?? ''),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  if (isAlreadyAdded) {
                                    controller.userslistNew.removeWhere(
                                        (participant) =>
                                            participant.userId == user.userId);

                                    controller.updateUserInRecentlySearched(
                                        user: user);
                                  } else {
                                    final participant =
                                        UserSearchSuccessResponce(
                                      name: user.name,
                                      userId: user.userId,
                                      // isAccepted: 'pending',
                                    );

                                    controller.userslistNew.add(participant);
                                    controller.addUserToRecentlySearched(
                                        user: user);
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
                                    gradient: const LinearGradient(
                                        colors: [kneon, kneon]),
                                    borderRadius: kBorderRadius5,
                                    border: Border.all(color: kneon),
                                  ),
                                  child: Text(
                                    isAlreadyAdded ? 'Remove' : 'Add',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                GetBuilder<CreateTaskController>(
                  id: 'searchUser',
                  builder: (controller) {
                    if (controller.searchLoading.value) {
                      return ShimmerLoaderSearchParticipants(
                          seprator: kHeight5,
                          itemCount: 5,
                          height: 50.h,
                          width: double.infinity);
                    } else if (controller.userslist.isEmpty) {
                      return Center(
                          child: Text(
                        'No participants found.',
                        style: Theme.of(context).textTheme.displaySmall,
                      ));
                    } else {
                      return ListView.separated(
                        controller: controller.searchScrollController,
                        itemCount: controller.userslist.length +
                            (taskController.searchLoadMoreLoading.value
                                ? 1
                                : 0),
                        separatorBuilder: (context, index) => Divider(
                          endIndent: 30.w,
                          indent: 30.w,
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
                            final isAlreadyAdded = controller.userslistNew.any(
                                (participant) =>
                                    participant.userId == user.userId);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: AssetImage(userProfileDummy),
                                ),
                                title: Text(
                                  user.name ?? 'No Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 13),
                                ),
                                subtitle: Text(
                                  maskEmail(user.email ?? ''),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    if (isAlreadyAdded) {
                                      controller.userslistNew.removeWhere(
                                          (participant) =>
                                              participant.userId ==
                                              user.userId);
                                      controller.updateUserInRecentlySearched(
                                          user: user);
                                    } else {
                                      final participant =
                                          UserSearchSuccessResponce(
                                        name: user.name,
                                        userId: user.userId,
                                        // isAccepted: 'pending',
                                      );
                                      controller.userslistNew.add(participant);
                                      controller.addUserToRecentlySearched(
                                          user: user);
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
                                      gradient: const LinearGradient(
                                          colors: [kneon, kneon]),
                                      borderRadius: kBorderRadius5,
                                      border: Border.all(color: kneon),
                                    ),
                                    child: Text(
                                      isAlreadyAdded ? 'Remove' : 'Add',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                if (accessController.userRole.value == 'employee')
                  GetBuilder<CreateTaskController>(
                    id: 'searchUser',
                    builder: (controller) {
                      if (controller.organizationSearchLoading.value) {
                        return ShimmerLoaderSearchParticipants(
                            seprator: kHeight5,
                            itemCount: 5,
                            height: 50.h,
                            width: double.infinity);
                      } else if (controller.organizationUserslist.isEmpty) {
                        return Center(
                            child: Text(
                          'No participants found.',
                          style: Theme.of(context).textTheme.displaySmall,
                        ));
                      } else {
                        return ListView.separated(
                          controller:
                              controller.organizationSearchScrollController,
                          itemCount: controller.organizationUserslist.length +
                              (taskController
                                      .organizationSearchLoadMoreLoading.value
                                  ? 1
                                  : 0),
                          separatorBuilder: (context, index) => Divider(
                            endIndent: 30.w,
                            indent: 30.w,
                            height: 0,
                            color: kgrey,
                            thickness: 0,
                          ),
                          itemBuilder: (context, index) {
                            if (index ==
                                    taskController
                                        .organizationUserslist.length &&
                                taskController
                                    .organizationSearchLoadMoreLoading.value) {
                              return ShimmerLoaderSearchParticipants(
                                seprator: kHeight10,
                                itemCount: 1,
                                height: 50.h,
                                width: 200.w,
                              );
                            } else {
                              final user =
                                  controller.organizationUserslist[index];
                              final isAlreadyAdded = controller.userslistNew
                                  .any((participant) =>
                                      participant.userId == user.userId);

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage: AssetImage(userProfileDummy),
                                  ),
                                  title: Text(
                                    user.name ?? 'No Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 13),
                                  ),
                                  subtitle: Text(
                                    maskEmail(user.email ?? ''),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 10),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      if (isAlreadyAdded) {
                                        controller.userslistNew.removeWhere(
                                            (participant) =>
                                                participant.userId ==
                                                user.userId);
                                        controller.updateUserInRecentlySearched(
                                            user: user);
                                      } else {
                                        final participant =
                                            UserSearchSuccessResponce(
                                          name: user.name,
                                          userId: user.userId,
                                          // isAccepted: 'pending',
                                        );

                                        controller.userslistNew
                                            .add(participant);
                                        controller.addUserToRecentlySearched(
                                            user: user);
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
                                        gradient: const LinearGradient(
                                            colors: [kneon, kneon]),
                                        borderRadius: kBorderRadius5,
                                        border: Border.all(color: kneon),
                                      ),
                                      child: Text(
                                        isAlreadyAdded ? 'Remove' : 'Add',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
