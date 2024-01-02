import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_main_screen/home_screen_main.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/second_animation_list.dart';
import 'package:flutter/material.dart';

class HomeScreenSecondPart extends StatefulWidget {
  const HomeScreenSecondPart({
    super.key,required this.animationController
  });

  final AnimationController animationController;

  @override
  State<HomeScreenSecondPart> createState() => _HomeScreenSecondPartState();
}

class _HomeScreenSecondPartState extends State<HomeScreenSecondPart> {
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      _scrollCallBack();
    });
    super.initState();
  }

  _scrollCallBack() {
    if (scrollController.offset > 0) {
      widget.animationController.forward().whenComplete(() {
       showCardsNotifier.value=HomeScreensList.second;
       showCardsNotifier.notifyListeners();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Reminders',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            adjustHieght(khieght * .02),
            Expanded(
              child: SecondAnimationPageListView(
                  scrollController: scrollController),
            ),
          ],
        ),
      ),
    );
  }
}
