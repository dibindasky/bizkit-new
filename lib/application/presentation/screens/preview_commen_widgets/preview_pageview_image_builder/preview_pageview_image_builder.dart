import 'dart:io';

import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/widget/bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:flutter/material.dart';

class PreviewPageviewImageBuilder extends StatefulWidget {
  const PreviewPageviewImageBuilder({super.key, this.images, this.imagesList});

  final List<File>? images;
  final List<String>? imagesList;

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
      pageCount: widget.images != null
          ? widget.images!.length
          : widget.imagesList!.length,
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
              // onTap: () => showModalBottomSheet(
              //   context: context,
              //   isScrollControlled: true,
              //   builder: (context) => PreviewPageViewBottomSheet(
              //     image: widget.images?[index],
              //     imageNetwork: widget.imagesList?[index],
              //   ),
              // ),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: widget.imagesList != null
                    ? Image.network(widget.imagesList![index],
                        fit: BoxFit.cover)
                    : Image.file(widget.images![index], fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}
