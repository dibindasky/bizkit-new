import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskInsideTheInnerFolderScreen extends StatelessWidget {
  const TaskInsideTheInnerFolderScreen({super.key, this.foldername});

  final String? foldername;

  @override
  Widget build(BuildContext context) {
    final folderController = Get.find<TaskFolderController>();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                    ),
                  ),
                  adjustWidth(20),
                  Text(
                    foldername ?? 'Folder Name',
                    style: textHeadStyle1.copyWith(fontSize: 18),
                  ),
                ],
              ),
              adjustHieght(10),
              if (folderController.isLoading.value)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (folderController.tasksInsideInnerFolder.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('No tasks available'),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    itemCount: folderController.tasksInsideInnerFolder.length,
                    itemBuilder: (context, index) {
                      return TaskContainer(
                        index: index,
                        tasksInsideInnerFolder:
                            folderController.tasksInsideInnerFolder[index],
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
