import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenPollDetailTask extends StatelessWidget {
  const ScreenPollDetailTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppbarCommen(tittle: 'Poll Details'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Poll Question',
                    style: textHeadStyle1.copyWith(color: kneonShade),
                  ),
                  const Text('Which quest should we take ?'),
                  adjustHieght(10.h),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            const PollDetailAnswerTile(),
                        separatorBuilder: (context, index) =>
                            adjustHieght(20.h),
                        itemCount: 3),
                  )
                ],
              ),
            ),
          ),
          // adjustHieght(20.h)
        ],
      ),
    );
  }
}

class PollDetailAnswerTile extends StatelessWidget {
  const PollDetailAnswerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: kBorderRadius15,
              border: Border.all(color: neonShade),
              color: kGrayLight),
          child: Text('Complete Development', style: textHeadStyle1),
        ),
        adjustHieght(20.h),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => adjustWidth(20.w),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                        border: index != 0
                            ? null
                            : Border.all(color: neonShade, width: 3.sp),
                        borderRadius: kBorderRadius5,
                        image: const DecorationImage(
                            image: AssetImage(imageDummyAsset),
                            fit: BoxFit.cover))),
                adjustHieght(3.h),
                Text(
                  'Person ${index + 1}',
                  style: textThinStyle1,
                )
              ],
            ),
          ),
        ),
        adjustHieght(20.h),
        SizedBox(
          height: 200.h,
          child: Stack(
            children: [
              Container(
                height: 200.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kGrayLight, borderRadius: kBorderRadius10),
                child: Column(
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Mauris mauris sollicitudin eget egestas malesuada congue vulputate ac sed.\n \nLorem ipsum dolor sit amet consectetur. Mauris mauris sollicitudin eget egestas malesuada congue vulputate ac sed.\n\nLorem ipsum dolor sit amet consectetur. Mauris mauris sollicitudin eget egestas malesuada congue vulputate ac sed.'),
                      ),
                    ),
                    adjustHieght(5.h),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '3hrs ago',
                          style: textThinStyle1.copyWith(color: klightgrey),
                        ))
                  ],
                ),
              ),
              ArrowMarkIndexChange(
                  alignment: Alignment.centerLeft, left: true, onTap: () {}),
              ArrowMarkIndexChange(
                  alignment: Alignment.centerRight, left: false, onTap: () {})
            ],
          ),
        ),
        adjustHieght(20.h)
      ],
    );
  }
}

class ArrowMarkIndexChange extends StatelessWidget {
  const ArrowMarkIndexChange({
    super.key,
    required this.onTap,
    required this.left,
    this.backgroundColor = kwhite,
    required this.alignment,
  });

  final VoidCallback onTap;
  final bool left;
  final Color backgroundColor;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor, borderRadius: kBorderRadius25),
            padding: EdgeInsets.all(8.w),
            child: Icon(left ? Icons.arrow_back : Icons.arrow_forward,
                color: kblack)),
      ),
    );
  }
}
