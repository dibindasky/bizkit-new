// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageOffsetContainers extends StatefulWidget {
  const ImageOffsetContainers({super.key});

  @override
  State<ImageOffsetContainers> createState() => _ImageOffsetContainersState();
}

class _ImageOffsetContainersState extends State<ImageOffsetContainers> {
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
    return AnimatedWidget(
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
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              image[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageCallBack = void Function(int index);

class AnimatedWidget extends StatelessWidget {
  const AnimatedWidget({
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
        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(
              0.0,
              100 * (index - pageValue),
            ),
            child: child(index, context),
          );
        } else if (index == pageValue.floor() ||
            index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(
              0.0,
              100 * (pageValue - index),
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
