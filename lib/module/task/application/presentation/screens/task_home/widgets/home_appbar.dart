import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskHomeAppBar extends StatelessWidget {
  const TaskHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Welcome\nGuest',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: lightGrey,
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => ListScreen(),
                  // ));
                },
              ),
            ),
            adjustWidth(10),
            Stack(
              children: [
                CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset('asset/icons/image 4 (Traced).png'),
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: kOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
