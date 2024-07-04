import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/leaves/widgets/leave_status_container.dart';
import 'package:flutter/material.dart';

class AttendenceLeavesGridView extends StatelessWidget {
  final List<String> titles;
  final List<String> subtitles;
  const AttendenceLeavesGridView(
      {super.key, required this.titles, required this.subtitles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.9,
      ),
      itemBuilder: (context, index) {
        return AttendenceLeaveStatusContainer(
          title: titles[index],
          subtitle: subtitles[index],
        );
      },
    );
  }
}
