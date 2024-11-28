import 'dart:io';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/image_preview.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BizcardLogoStoryViewBottomSheet extends StatefulWidget {
  const BizcardLogoStoryViewBottomSheet(
      {super.key,
      this.image,
      this.logoNetworkImage,
      this.logoStory,
      this.compnayStory,
      this.myStory,
      this.showMyStory = true});

  final File? image;
  final String? logoNetworkImage;
  final String? logoStory;
  final String? compnayStory;
  final String? myStory;
  final bool showMyStory;

  @override
  State<BizcardLogoStoryViewBottomSheet> createState() =>
      _BizcardLogoStoryViewBottomSheetState();
}

class _BizcardLogoStoryViewBottomSheetState
    extends State<BizcardLogoStoryViewBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: khieght * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              indicatorPadding: const EdgeInsets.all(5),
              dividerColor: knill,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: kBorderRadius20,
              ),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Logo Story',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Tab(
                  child: Text(
                    'Compnay Story',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                if (widget.showMyStory)
                  Tab(
                    child: Text(
                      'My Story',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
              ],
            ),
            adjustHieght(khieght * .01),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  logoLogoStory(context),
                  storyBuilder(
                      context, 'The Company Story', widget.compnayStory),
                  if (widget.showMyStory)
                    storyBuilder(context, 'My Story', widget.myStory),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget storyBuilder(BuildContext context, String headline, String? story) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          adjustHieght(khieght * .01),
          Text(
            story ?? '',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          kHeight40
        ],
      ),
    );
  }

  Widget logoLogoStory(BuildContext context) {
    return Column(
      children: [
        InkWell(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             ScreenImagePreview(image: networkImage!))),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: SizedBox(
              height: 150.h,
              width: double.infinity,
              child: NetworkImageWithLoader(widget.logoNetworkImage ?? ''),
            ),
          ),
        ),
        adjustHieght(khieght * .02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Logo Story',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              adjustHieght(khieght * .01),
              Text(
                widget.logoStory ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              kHeight40
            ],
          ),
        ),
      ],
    );
  }
}
