import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/poll.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenPollDetailTask extends StatelessWidget {
  const ScreenPollDetailTask({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardAppbarCommen(tittle: 'Poll Details'),
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
                  Obx(() {
                    return Text(controller.pollDetail.value.pollQuestion ?? '');
                  }),
                  adjustHieght(10.h),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                          itemBuilder: (context, index) => PollDetailAnswerTile(
                                pollAnswer: controller
                                    .pollDetail.value.pollAnswers![index],
                              ),
                          separatorBuilder: (context, index) =>
                              adjustHieght(20.h),
                          itemCount:
                              controller.pollDetail.value.pollAnswers?.length ??
                                  0);
                    }),
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

class PollDetailAnswerTile extends StatefulWidget {
  const PollDetailAnswerTile({super.key, required this.pollAnswer});

  final PollAnswer pollAnswer;

  @override
  State<PollDetailAnswerTile> createState() => _PollDetailAnswerTileState();
}

class _PollDetailAnswerTileState extends State<PollDetailAnswerTile> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.pollAnswer.supporters?.length == 0) {
      return kempty;
    }
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: kBorderRadius15,
              border: Border.all(color: neonShade),
              color: kGrayLight),
          child:
              Text(widget.pollAnswer.answerText ?? '', style: textHeadStyle1),
        ),
        adjustHieght(20.h),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            itemCount: widget.pollAnswer.supporters?.length ?? 0,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => adjustWidth(20.w),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          border: index != selectedIndex
                              ? null
                              : Border.all(color: neonShade, width: 3.sp),
                          borderRadius: kBorderRadius5,
                          image: const DecorationImage(
                              image: AssetImage(imageDummyAsset),
                              fit: BoxFit.cover))),
                  adjustHieght(3.h),
                  Text(
                    widget.pollAnswer.supporters?[index].name ?? '',
                    style: textThinStyle1,
                  )
                ],
              ),
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(widget
                                .pollAnswer.supporters?[selectedIndex].reason ??
                            ''),
                      ),
                    ),
                    // adjustHieght(5.h),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Text(
                    //       '3hrs ago',
                    //       style: textThinStyle1.copyWith(color: klightgrey),
                    //     ))
                  ],
                ),
              ),
              ArrowMarkIndexChange(
                  alignment: Alignment.centerLeft,
                  left: true,
                  onTap: () {
                    if (selectedIndex > 0) {
                      selectedIndex--;
                      setState(() {});
                    }
                  }),
              ArrowMarkIndexChange(
                  alignment: Alignment.centerRight,
                  left: false,
                  onTap: () {
                    if (selectedIndex <
                        (widget.pollAnswer.supporters?.length ?? 0) - 1) {
                      selectedIndex++;
                      setState(() {});
                    }
                  })
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
