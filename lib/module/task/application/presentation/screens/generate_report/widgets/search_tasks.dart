import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchTasksWidget extends StatelessWidget {
  const SearchTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(id: 1);
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Hero(
                tag: 'taskSearch',
                child: TaskTextField(
                  showBorder: true,
                  fillColor: textFieldFillColr,
                  controller: taskController.taskSearchController,
                  onChanged: (value) {
                    taskController.searchTasks();
                  },
                  onTapOutside: () => FocusScope.of(context).unfocus(),
                  hintText: 'Search with title , des , type etc..',
                  suffixIcon: const Icon(Icons.search, color: neonShade),
                ),
              ),
              adjustHieght(15.h),
              // Expanded(
              //   child: Obx(
              //     () {
              //       if (taskController.isLoading.value) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else if (taskController.tasksSearch.isEmpty) {
              //         return ErrorRefreshIndicator(
              //           image: emptyNodata2,
              //           errorMessage: 'No Tasks',
              //           onRefresh: () {},
              //         );
              //       } else {
              //         return ListView.builder(
              //           itemCount: taskController.tasksSearch.length,
              //           itemBuilder: (context, index) => ListTile(
              //             onTap: () {},
              //             title: Text(taskController.tasksSearch[index].title ??
              //                 'title'),
              //             subtitle: Text(
              //                 taskController.tasksSearch[index].description ??
              //                     'description'),
              //           ),
              //         );
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
