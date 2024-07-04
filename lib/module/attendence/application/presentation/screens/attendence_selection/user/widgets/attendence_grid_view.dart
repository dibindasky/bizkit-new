import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/widgets/grid_container.dart';
import 'package:flutter/material.dart';

class AttendenceSelectionGridView extends StatelessWidget {
  final List<String> images;
  final List<String> titles;
  final List<void Function()> onTaps;
  const AttendenceSelectionGridView({
    super.key,
    required this.images,
    required this.titles,
    required this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 25,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return AttendenceGridContainer(
          imageUrl: images[index],
          title: titles[index],
          onTap: onTaps[index],
        );
      },
    );
  }
}
