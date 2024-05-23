import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key});
  final List<Map<String, String>> tasks = [
    {
      'title': 'Edit a Picture',
      'description':
          'Image editing encompasses the processes of altering images, whether they are digital photographs, traditional photo-chemical photographs, or illustrations. Traditional analog image editing is known as photo retouching, using tools such as an airbrush to modify photographs or editing illustrations with any traditional art medium.',
      'date': 'Feb, 21 - Mar, 27',
      'color': '0xFFe57373'
    },
    {
      'title': 'New Project User Flow',
      'description':
          'User interface (UI) design is the process designers use to build interfaces in software or computerized devices, focusing on looks or style. Designers aim to create interfaces which users find easy to use and pleasurable. UI design refers to graphical user interfaces and other forms e.g., voice-controlled interfaces.',
      'date': 'Feb, 21 - Mar, 12',
      'color': '0xFFFFB74D'
    },
    {
      'title': 'Laravel Task',
      'description':
          'Laravel is a web application framework with expressive, elegant syntax. Web development must be an enjoyable and creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication.',
      'date': 'Feb, 21 - Mar, 22',
      'color': '0xFF64B5F6'
    },
    {
      'title': 'Edit a Picture',
      'description':
          'Image editing encompasses the processes of altering images, whether they are digital photographs, traditional photo-chemical photographs, or illustrations. Traditional analog image editing is known as photo retouching, using tools such as an airbrush to modify photographs or editing illustrations with any traditional art medium.',
      'date': 'Feb, 21 - Mar, 27',
      'color': '0xFFe57373'
    },
  ];

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
                                  'asset/icons/Vector.png',
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