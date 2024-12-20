import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/preview_pageview_image_builder/widget/bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/images/image_slidable_list.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';

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
          showPreview: () {
            List<String> images = widget.story != null
                ? widget.imagesList.sublist(1)
                : widget.imagesList;
            images.isNotEmpty
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SlidablePhotoGallery(
                            images: images,
                            initialIndex:
                                widget.story != null ? index - 1 : index)))
                : null;
          },
          isStory: widget.isStory,
          image: widget.imagesList[index],
          story: index == widget.storyIndex ? widget.story : null,
        );
      },
    );
  }
}

class ImagePreviewScrollView extends StatefulWidget {
  const ImagePreviewScrollView(
      {super.key,
      required this.image,
      this.story,
      this.isStory,
      this.showPreview});

  final String image;
  final String? story;
  final bool? isStory;
  final VoidCallback? showPreview;

  @override
  State<ImagePreviewScrollView> createState() => _ImagePreviewScrollViewState();
}

class _ImagePreviewScrollViewState extends State<ImagePreviewScrollView> {
  // Uint8List image = Uint8List(0);
  // @override
  // void initState() {
  //   image = base64Decode(widget.image);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            // if (widget.isStory ?? false) {
            //   Navigator.of(context).push(cardFadePageRoute(ScreenImagePreview(
            //     image: widget.image,
            //   )));
            // }
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
            } else if (widget.showPreview != null) {
              widget.showPreview!();
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: NetworkImageWithLoader(widget.image),
            // Image.memory(
            //   image,
            //   errorBuilder: (context, error, stackTrace) =>
            //       const Icon(Icons.image_not_supported_outlined),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
