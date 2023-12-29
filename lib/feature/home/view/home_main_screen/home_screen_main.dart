import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_first_part.dart';
import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/feature/home/view/home_second_screen/second_screen_anime.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> showCardsNotifier = ValueNotifier(false);

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: showCardsNotifier,
        builder: (context, value, child) {
          if (!value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const HomeScreenFirstPart(), HomeScreenSecondPart()],
            );
          }else{
            return const SecondAnimation();
          }
        },
      )),
    );
  }
}




// Expanded(
//                 child: GestureDetector(
//                   onVerticalDragEnd: (details) async {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const SecondAnimation(),
//                       ),
//                     );
//                   },
//                   child: const HomeScreenSecondPart(),
//                 ),
//               ),