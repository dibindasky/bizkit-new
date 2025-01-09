import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';

class AssinessQuickTaskList extends StatelessWidget {
  const AssinessQuickTaskList({super.key, required this.quickTask});

  final QuickTasks quickTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Assinees', style: Theme.of(context).textTheme.displayMedium),
        const Divider(thickness: 0.1),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemCount: quickTask.assignedTo?.length ?? 0,
            itemBuilder: (context, index) {
              final item =
                  quickTask.assignedTo?[index] ?? QuickTaskAssignedToResponce();
              return ListTile(
                leading: CircleAvatar(
                  child: NetworkImageWithLoader(
                    item.profilePicture ?? '',
                    errorWidget: const Icon(Icons.person),
                    radius: 50,
                  ),
                ),
                title: Text(item.name ?? '',
                    style: Theme.of(context).textTheme.displaySmall),
              );
            },
            separatorBuilder: (context, index) => const Divider(thickness: 0.1),
          ),
        ))
      ],
    );
  }
}
