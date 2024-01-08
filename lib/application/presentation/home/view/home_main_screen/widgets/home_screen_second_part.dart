import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/home/view/home_main_screen/home_screen_main.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/second_animation_list.dart';
import 'package:flutter/material.dart';

class HomeScreenSecondPart extends StatefulWidget {
  const HomeScreenSecondPart({super.key, required this.animationController});

  final List<AnimationController> animationController;

  @override
  State<HomeScreenSecondPart> createState() => _HomeScreenSecondPartState();
}

class _HomeScreenSecondPartState extends State<HomeScreenSecondPart> with ChangeNotifier{
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
      widget.animationController[0].forward().whenComplete(() {
        showCardsNotifier.value = HomeScreensList.second;
        showCardsNotifier.notifyListeners();
      });
      widget.animationController[1]
          .forward()
          .whenComplete(() => widget.animationController[2].forward());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Reminders', style: textHeadStyle1),
            ],
          ),
          adjustHieght(kwidth * .035),
          Expanded(
            child: SecondAnimationPageListView(
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
