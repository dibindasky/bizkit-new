import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskSelectionScreen extends StatelessWidget {
  final String folderId;
  final String? innerFolderId;
  final bool? isFromInner;
  final TextEditingController searchController = TextEditingController();

  TaskSelectionScreen({
    Key? key,
    required this.folderId,
    this.innerFolderId,
    this.isFromInner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final folderController = Get.find<TaskFolderController>();

    taskController.selectedTasks.clear();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Tasks to Add'),
        backgroundColor: kblack,
      ),
      body: Container(
        color: kblack,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            adjustHieght(10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskTextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    taskController.searchTasks(searchItem: value);
                  }
                },
                controller: searchController,
                hintText: 'Search Tasks',
                showBorder: true,
                fillColor: textFieldFillColr,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: neonShade),
                ),
              ),
            ),
            adjustHieght(10.h),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    itemCount: taskController.tasksSearch.length,
                    itemBuilder: (context, index) {
                      final task = taskController.tasksSearch[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            task.title ?? 'Title',
                            style: const TextStyle(color: kwhite),
                          ),
                          trailing: Obx(
                            () => Checkbox(
                              checkColor: kblack,
                              activeColor: neonShade,
                              value:
                                  taskController.selectedTasks.contains(task),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  taskController.selectedTasks.add(task);
                                } else {
                                  taskController.selectedTasks.remove(task);
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (isFromInner == true) {
                  if (taskController.selectedTasks.isNotEmpty) {
                    List<String> selectedTaskIds = taskController.selectedTasks
                        .map((task) => task.id!)
                        .toList();
                    TaskAddOrDeleteInnerFolderModel
                        addOrDeleteInnerFolderModel =
                        TaskAddOrDeleteInnerFolderModel(
                      folderId: folderId,
                      innerFolderId: innerFolderId,
                      innerFolderTasks: selectedTaskIds,
                    );

                    folderController.taskAddOrDeleteInnerFolder(
                        taskAddOrDelete: addOrDeleteInnerFolderModel);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No tasks selected'),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                } else {
                  if (taskController.selectedTasks.isNotEmpty) {
                    List<String> selectedTaskIds = taskController.selectedTasks
                        .map((task) => task.id!)
                        .toList();

                    TaskAddToFolderModel taskAddToFolder = TaskAddToFolderModel(
                      folderId: folderId,
                      tasks: selectedTaskIds,
                    );

                    folderController.tasksAddToFolder(
                        taskAddToFolder: taskAddToFolder);

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No tasks selected'),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
              child: const Text('Add Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
