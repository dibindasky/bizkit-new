import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Stack(
          children: [
            Card(
              color: lightGrey,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 3,
                  color: Color(int.parse(task['color']!)),
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'asset/images/icon/Vector.png',
                                  scale: 2,
                                ),
                                adjustWidth(10),
                                Text(
                                  task['title']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                            PopupMenuButton<String>(
                              color: kwhite,
                              icon: const Icon(Icons.more_horiz, color: kwhite),
                              onSelected: (value) {
                                if (value == 'edit') {
                                } else if (value == 'delete') {}
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  const PopupMenuItem<String>(
                                    value: 'Move task',
                                    child: Text(
                                      'Move task',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Spot light Task',
                                    child: Text(
                                      'Spot light Task',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Add Sub Task',
                                    child: Text(
                                      'Add Sub Task',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ),
                                ];
                              },
                            ),
                          ],
                        ),
                        Text(
                          task['description']!,
                          style: const TextStyle(color: kwhite, fontSize: 12),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            task['date']!,
                            style: const TextStyle(
                              color: kwhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              bottom: 50,
              left: 0,
              child: Container(
                color: klightgrey,
                width: 4,
                height: 100,
              ),
            )
          ],
        );
      },
    );
  }
}
