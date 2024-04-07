import 'dart:convert';

import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/widget/bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreviewPageviewImageBuilder extends StatefulWidget {
  const PreviewPageviewImageBuilder({super.key, required this.imagesList});

  final List<String> imagesList;

  @override
  State<PreviewPageviewImageBuilder> createState() =>
      _PreviewPageviewImageBuilderState();
}

class _PreviewPageviewImageBuilderState
    extends State<PreviewPageviewImageBuilder> {
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
    return HomeScreenPagviewAnimateBuilder(
      pageController: pageController,
      pageValue: pageValue,
      pageCount: widget.imagesList.length,
      onpageCallBack: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      child: (index, _) {
        return SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => PreviewPageViewBottomSheet(
                  imageNetwork: widget.imagesList[index],
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.memory(
                 base64Decode(widget.imagesList[index]), // Empty byte array if invalid base64 string
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

