import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:flutter/material.dart';

class HomeScreenPageviewAnimatedContaner extends StatefulWidget {
  const HomeScreenPageviewAnimatedContaner(
      {super.key, required this.fadeCallBack});

  final VoidCallback fadeCallBack;

  @override
  State<HomeScreenPageviewAnimatedContaner> createState() =>
      _HomeScreenPageviewAnimatedContanerState();
}

class _HomeScreenPageviewAnimatedContanerState
    extends State<HomeScreenPageviewAnimatedContaner> {
  List<String> image = [
    'asset/images/previewiamge1.jpeg',
    'asset/images/previewImage2.jpeg',
    'asset/images/previewImage3.jpeg',
    'asset/images/previewImage4.jpeg',
    'asset/images/previewimage5.jpeg',
  ];
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 0.6,
      child: HomeScreenPagviewAnimateBuilder(
        pageController: pageController,
        pageValue: pageValue,
        pageCount: image.length,
        onpageCallBack: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        child: (index, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showCardsNotifier.value = HomeScreensList.third;
                widget.fadeCallBack();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: neonShade,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SecondScreenPageViewContents(),
              ),
            ),
          );
        },
      ),
    );
  }
}
