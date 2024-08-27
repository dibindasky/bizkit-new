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
    print(controller.pollDetail.value.toJson());
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
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => PollDetailAnswerTile(
                                index: index,
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
  const PollDetailAnswerTile({super.key, required this.index});

  final int index;

  @override
  State<PollDetailAnswerTile> createState() => _PollDetailAnswerTileState();
}

class _PollDetailAnswerTileState extends State<PollDetailAnswerTile> {
  final controller = Get.find<ChatController>();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pollAnswer = controller.pollDetail.value.pollAnswers?[widget.index];
    final isAnonymous = controller.pollDetail.value.anonymousVote ?? true;
    final isResonRequired = controller.pollDetail.value.resonRequired ?? true;
    final isMultipleAnswer =
        controller.pollDetail.value.multipleAnswer ?? false;
    if (pollAnswer?.supporters?.isEmpty ?? true) {
      return kempty;
    }
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
              borderRadius: kBorderRadius15,
              border: Border.all(color: neonShade),
              color: kGrayLight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Text(pollAnswer?.answerText ?? '', style: textStyle1)),
              kWidth10,
              Text(
                  '${pollAnswer?.answerVotes ?? 0} Vote${(pollAnswer?.answerVotes ?? 0) == 1 ? '' : 's'}',
                  style: textThinStyle1.copyWith(fontSize: 10.sp))
            ],
          ),
        ),
        adjustHieght(10.h),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            itemCount: pollAnswer?.supporters?.length ?? 0,
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
                          color: klightGreyClr,
                          image: isAnonymous
                              ? null
                              : const DecorationImage(
                                  image: AssetImage(imageDummyAsset),
                                  fit: BoxFit.cover)),
                      child: isAnonymous ? const Icon(Icons.person) : null),
                  adjustHieght(3.h),
                  Text(
                    isAnonymous
                        ? "User"
                        : pollAnswer?.supporters?[index].name ?? '',
                    style: textThinStyle1,
                  )
                ],
              ),
            ),
          ),
        ),
        !isResonRequired || isMultipleAnswer ? kempty : adjustHieght(20.h),
        !isResonRequired || isMultipleAnswer
            ? kempty
            : SizedBox(
                height: 200.h,
                child: Stack(
                  children: [
                    Container(
                      height: 200.h,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 20.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kGrayLight, borderRadius: kBorderRadius10),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(pollAnswer
                                      ?.supporters?[selectedIndex].reason ??
                                  ''),
                            ),
                          ),
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
                              (pollAnswer?.supporters?.length ?? 0) - 1) {
                            selectedIndex++;
                            setState(() {});
                          }
                        })
                  ],
                ),
              ),
        isMultipleAnswer ? kempty : adjustHieght(20.h)
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
