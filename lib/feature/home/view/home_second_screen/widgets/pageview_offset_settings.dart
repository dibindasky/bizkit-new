import 'package:flutter/material.dart';

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageCallBack = void Function(int index);

class HomeScreenPagviewAnimatedWidget extends StatelessWidget {
  const HomeScreenPagviewAnimatedWidget({
    Key? key,
    required this.pageController,
    required this.pageValue,
    required this.child,
    required this.pageCount,
    required this.onpageCallBack,
  }) : super(key: key);
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pageCount;
  final OnPageCallBack onpageCallBack;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onpageCallBack,
      controller: pageController,
      itemCount: pageCount,
      itemBuilder: (context, index) {
        double translation = 50.0;

        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(
              0.0,
              translation *
                  (index - pageValue), // Linear translation for next pages
            ),
            child: child(index, context),
          );
        } else if (index == pageValue.floor() ||
            index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(
              0,
              translation * (pageValue - index),
            ),
            child: child(index, context),
          );
        } else {
          return child(index, context);
        }
      },
    );
  }
}
