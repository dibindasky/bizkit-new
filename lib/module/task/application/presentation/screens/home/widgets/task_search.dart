import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskSearchScreen extends StatelessWidget {
  const TaskSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final TextEditingController searchController = TextEditingController();

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
                  controller: searchController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      taskController.searchTasks(searchItem: value);
                    } else {
                      taskController.searchTasks(searchItem: value);
                    }
                  },
                  onTapOutside: () => FocusScope.of(context).unfocus(),
                  hintText: 'Find your task',
                  suffixIcon: const Icon(Icons.search, color: neonShade),
                ),
              ),
              adjustHieght(15.h),
              Expanded(
                child: Obx(
                  () {
                    if (taskController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (taskController.tasksSearch.isEmpty) {
                      return ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No Tasks',
                        onRefresh: () {},
                      );
                    } else {
                      return ListView.builder(
                        itemCount: taskController.tasksSearch.length,
                        itemBuilder: (context, index) => ListTile(
                          onTap: () {},
                          title: Text(taskController.tasksSearch[index].title ??
                              'title'),
                          subtitle: Text(
                              taskController.tasksSearch[index].description ??
                                  'description'),
                        ),
                      );
                    }
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