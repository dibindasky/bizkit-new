import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class HierarchyListtile extends StatelessWidget {
  const HierarchyListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomStackOnlineDotCircleAvatar(
        image: dummyPersonImage,
        dotColor: neonShade,
        backgroundColor: knill,
      ),
      title: Row(
        children: [
          const Text('Addam smith'),
          adjustWidth(50),
          Text(
            '12 Tasks',
            style: TextStyle(
              color: Color(int.parse('0xFFFF6006')),
            ),
          )
        ],
      ),
    );
  }
}
