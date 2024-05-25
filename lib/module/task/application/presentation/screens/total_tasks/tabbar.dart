import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                        adjustHieght(10),
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                borderRadius: kBorderRadius10,
                                minHeight: 13,
                                value: 0.10 *
                                    double.parse(task['percentage'] ?? '2'),
                                backgroundColor: smallBigGrey,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    neonShade),
                              ),
                            ),
                            adjustWidth(30),
                            Text(task['percentage'] ?? '2')
                          ],
                        ),
                        adjustHieght(10),
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

class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({super.key});

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(_animationController);

    // Start the animation
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LinearProgressIndicator(
          minHeight: 13,
          value: 20 / 2, // Progress value
          backgroundColor: smallBigGrey,
          valueColor: _colorAnimation,
        );
      },
    );
  }
}
