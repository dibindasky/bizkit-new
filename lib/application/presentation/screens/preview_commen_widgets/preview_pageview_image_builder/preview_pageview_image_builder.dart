import 'dart:convert';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/widget/bottom_sheet.dart';
import 'package:bizkit/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreviewPageviewImageBuilder extends StatefulWidget {
  const PreviewPageviewImageBuilder({
    super.key,
    required this.imagesList,
    this.story,
    this.storyIndex,
    this.isStory,
  });

  final List<String> imagesList;
  final String? story;
  final int? storyIndex;
  final bool? isStory;

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
        return ImagePreviewScrollView(
            isStory: widget.isStory,
            image: widget.imagesList[index],
            story: index == widget.storyIndex ? widget.story : null);
      },
    );
  }
}

class ImagePreviewScrollView extends StatefulWidget {
  const ImagePreviewScrollView(
      {super.key, required this.image, this.story, this.isStory});

  final String image;
  final String? story;
  final bool? isStory;

  @override
  State<ImagePreviewScrollView> createState() => _ImagePreviewScrollViewState();
}

class _ImagePreviewScrollViewState extends State<ImagePreviewScrollView> {
  Uint8List image = Uint8List(0);
  @override
  void initState() {
    image = base64Decode(widget.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            if (widget.isStory != null) {
              Navigator.of(context).push(fadePageRoute(ScreenImagePreview(
                image: widget.image,
              )));
            }
            if (widget.story != null) {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                isDismissible: true,
                showDragHandle: true,
                backgroundColor: kblack,
                builder: (context) => PreviewPageViewBottomSheet(
                  memoryImage: widget.image,
                  logoStory: widget.story,
                ),
              );
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.memory(
              image,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
