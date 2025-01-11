import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class NextActionDateSection extends StatelessWidget {
  const NextActionDateSection({
    super.key,
    required this.taskId,
  });

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ((taskController.singleTask.value.nextActionDate?.isEmpty ??
            //             true) &&
            //         (taskController.singleTask.value.isOwned ?? false))
            //     ? Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GestureDetector(
            //           onTap: () {
            //             if ((taskController.singleTask.value.isOwned ??
            //                 false)) {
            //               showDialog(
            //                 context: context,
            //                 builder: (BuildContext context) {
            //                   return NADCreateAndUpdateDialog(
            //                     taskId: taskId ?? '',
            //                     taskController: taskController,
            //                   );
            //                 },
            //               );
            //             }
            //           },
            //           child: Container(
            //             padding: const EdgeInsets.all(10.0),
            //             decoration: BoxDecoration(
            //               border: Border.all(color: kneon),
            //               borderRadius: kBorderRadius10,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   'Add Next Action Date',
            //                   style: Theme.of(context).textTheme.displaySmall,
            //                 ),
            //                 if ((taskController.singleTask.value.isOwned ??
            //                     false))
            //                   const Icon(Icons.add)
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //     :
            Obx(() {
              final nextActionDate =
                  taskController.singleTask.value.nextActionDate;
              if (taskController.isLoading.value) {
                return SizedBox(
                  height: 30.h,
                  child: ShimmerLoader(
                    height: 30.h,
                    itemCount: 5,
                    width: 80.w,
                    scrollDirection: Axis.horizontal,
                    seprator: const SizedBox(width: 8),
                  ),
                );
              } else if (nextActionDate?.isEmpty ?? true) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Next Action Dates',
                            style: Theme.of(context).textTheme.displaySmall),
                        if ((taskController.singleTask.value.isCompleted !=
                                    true &&
                                taskController.singleTask.value.isKilled !=
                                    true) &&
                            taskController.singleTask.value.isOwned == true)
                          IconButton(
                            onPressed: () {
                              if (internetConnectinController
                                  .isConnectedToInternet.value) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NADCreateAndUpdateDialog(
                                      taskId: taskId ?? '',
                                      taskController: taskController,
                                    );
                                  },
                                );
                              } else {
                                showCustomToast(
                                  message:
                                      'You must be online to create a next action date. Please check your internet connection.',
                                  backgroundColor: kred,
                                );
                              }
                            },
                            icon: const Icon(Icons.add),
                          )
                      ],
                    ),
                    adjustHieght(10.h),
                    Center(
                      child: Text('No Next action date available',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: kGreyNormal, fontSize: 11)),
                    ),
                    adjustHieght(15.h),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Next Action Dates',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 14)),
                        IconButton(
                          onPressed: () {
                            if (internetConnectinController
                                .isConnectedToInternet.value) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return NADCreateAndUpdateDialog(
                                    taskId: taskId ?? '',
                                    taskController: taskController,
                                  );
                                },
                              );
                            } else {
                              showCustomToast(
                                message:
                                    'You must be online to create a next action date. Please check your internet connection.',
                                backgroundColor: kred,
                              );
                            }
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.w,
                      children:
                          List.generate(nextActionDate?.length ?? 0, (index) {
                        final nextAction = nextActionDate?[index];
                        return GestureDetector(
                          onTap: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return NADCreateAndUpdateDialog(
                            //       taskId: taskId ?? '',
                            //       taskController: taskController,
                            //       isEdit: true,
                            //       index: index,
                            //       nextActionDate: NextActionDate(
                            //           description: nextAction?.description,
                            //           date: nextAction?.date,
                            //           byWhom: nextAction?.userId),
                            //     );
                            //   },
                            // );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Next Action Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          GoRouter.of(context).pop();
                                        },
                                        child: const CircleAvatar(
                                          radius: 18,
                                          backgroundColor: kblack,
                                          child: Icon(
                                            Icons.close,
                                            color: kwhite,
                                            size: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  content: Container(
                                    // decoration: BoxDecoration(
                                    //   color: kGreyNormal.withOpacity(0.1),
                                    //   borderRadius: kBorderRadius15,
                                    // ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flash(
                                                    animate: true,
                                                    child: Text('Action Date :',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                              fontSize: 13,
                                                            )),
                                                  ),
                                                  Flash(
                                                    animate: true,
                                                    child: Text(
                                                        ' ${nextAction?.date}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                              fontSize: 13,
                                                            )),
                                                  ),
                                                ],
                                              ),
                                              adjustHieght(10.h),
                                              Text(
                                                  textAlign: TextAlign.start,
                                                  '${nextAction?.description}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(
                                                          color: kGreyNormal)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: NetworkImageWithLoader(
                                              errorWidget: const CircleAvatar(
                                                backgroundColor: kblack,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 18,
                                                  color: kwhite,
                                                ),
                                              ),
                                              radius: 15,
                                              nextAction?.userProfile ?? ''),
                                        ),
                                        adjustWidth(10.w),
                                        Text(
                                            overflow: TextOverflow.ellipsis,
                                            'Created by ${nextAction?.userName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(fontSize: 10)),
                                      ],
                                    ),
                                  ],
                                  // actions: [
                                  //   Center(
                                  //     child: EventButton(
                                  //         width: double.infinity,
                                  //         color: neonNewLinearGradient,
                                  //         text: 'Update Next Action Date',
                                  //         onTap: () {
                                  //           Navigator.of(context).pop(context);
                                  //           showDialog(
                                  //             context: context,
                                  //             builder: (BuildContext context) {
                                  //               return NADCreateAndUpdateDialog(
                                  //                 nextActionDate: tag,
                                  //                 isEdit: true,
                                  //                 taskId: taskId ?? '',
                                  //                 taskController:
                                  //                     taskController,
                                  //               );
                                  //             },
                                  //           );
                                  //         }),
                                  //   ),
                                  // ],
                                );
                              },
                            );
                          },
                          child: NextActionChip(label: nextAction),
                        );
                      }),
                    ),
                  ],
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NADCreateAndUpdateDialog extends StatelessWidget {
  NADCreateAndUpdateDialog(
      {super.key,
      required this.taskController,
      this.nextActionDate,
      this.index,
      this.taskId,
      this.isEdit = false});

  final CreateTaskController taskController;

  final bool? isEdit;
  final int? index;
  final String? taskId;
  NextActionDate? nextActionDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (isEdit == true) {
      taskController.nexActiondateDescriptionController.text =
          nextActionDate?.description ?? '';
      taskController.nextActionDate.value = nextActionDate?.date ?? '';
    }
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isEdit == true ? 'Edit Next Action Date' : 'New Next Action Date',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 14),
          ),
          IconButton(
            onPressed: () {
              taskController.nexActiondateDescriptionController.clear();
              taskController.nextActionDate.value = '';
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => DeadlineChooserNextActionDate(
                  error: taskController.nextActionDateAddedError.value,
                  nextActionDate: nextActionDate,
                  nextActionFromEdit: isEdit,
                  onPressed: (date) {
                    taskController.nextActionDate.value = date;
                    taskController.nextActionDateAddedError.value = false;
                    FocusScope.of(context).unfocus();
                  },
                )),
            adjustHieght(10.h),
            TaskTextField(
              maxLines: 5,
              hintText: 'Description',
              maxLength: 150,
              textCapitalization: TextCapitalization.sentences,
              controller: taskController.nexActiondateDescriptionController,
              onTapOutside: () => FocusScope.of(context).unfocus(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Description is required';
                }

                return null;
              },
            ),
            adjustHieght(15.h),
            Obx(() => Center(
                child: EventButton(
                    width: double.infinity,
                    textColr: kwhite,
                    color: neonNewLinearGradient,
                    text: taskController.loadingForNextActionDate.value
                        ? 'Loading....'
                        : isEdit == true
                            ? 'Update'
                            : 'Create',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (taskController.nextActionDate.value.isEmpty) {
                          taskController.nextActionDateAddedError.value = true;
                          return;
                        }
                        if (isEdit == true) {
                          taskController.editNextActionDate(
                              index: index!, context: context);
                        } else {
                          taskController.createNewNextActionDate(
                            context: context,
                            createNadModel: EditTaskModel(
                              taskId: taskId,
                            ),
                          );
                        }
                      }
                    }))),
          ],
        ),
      ),
    );
  }
}
