// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: GestureDetector(
            onTap: () => previewBottomSheet(context, image[index]),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                image[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  void previewBottomSheet(BuildContext context, String image) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          color: homescreenbottomsheetcolr,
          width: double.infinity,
          // padding: const EdgeInsets.all(16),
          height: khieght * 3.3 / 4,
          child: ListView(
            children: [
              adjustHieght(khieght * .005),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height: 5.dm,
                  width: 85,
                ),
              ),
              adjustHieght(khieght * .01),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              adjustHieght(khieght * .02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Back Story',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    adjustHieght(khieght * .01),
                    const Text(
                      "The green square represents Xbox (fun). The blue square represents Microsoft Windows (calmness). The yellow square represents Bing (optimism and creativity). If you look closely at the logo, you will notice that the Microsoft logo is inspired by the Windows logo, which is one of the company's most prominent products.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    adjustHieght(khieght * .01),
                    Text(
                      'When',
                      style: TextStyle(
                        fontFamily: 'Euclid',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    adjustHieght(khieght * .01),
                    const Text(
                      "t was designed in 1975 when William Gates and Paul Allen thought of foraying into the technology world. They launched Microsoft on April 4, 1975. Simon Daniels designed the first-ever logo for the Company. The logo design comprised letters in the shape of Disco music discs.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
