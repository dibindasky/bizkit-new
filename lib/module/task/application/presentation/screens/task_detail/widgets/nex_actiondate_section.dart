import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Next Action Dates',
                            style: Theme.of(context).textTheme.displaySmall),
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
                    adjustHieght(15.h),
                    Center(
                      child: Text('No Next action date available',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: kGreyNormal, fontSize: 11)),
                    ),
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
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Card(
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(25.0),
                                                child: Text(
                                                    '${nextAction?.date}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Card(
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(25.0),
                                                child: Text(
                                                    '${nextAction?.description}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
