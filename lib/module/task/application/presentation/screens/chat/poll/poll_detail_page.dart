import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/utils/widgets/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/popup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenPollDetailTask extends StatelessWidget {
  const ScreenPollDetailTask({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const PopupBackButton(),
                Text('Poll Details',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poll Question',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 15, color: neonShade),
                    ),
                    Obx(() {
                      return Text(
                        controller.pollDetail.value.pollQuestion ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 13),
                      );
                    }),
                    adjustHieght(10.h),
                    Expanded(
                      child: Obx(() {
                        return ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) =>
                                PollDetailAnswerTile(
                                  index: index,
                                ),
                            separatorBuilder: (context, index) =>
                                adjustHieght(5.h),
                            itemCount: controller
                                    .pollDetail.value.pollAnswers?.length ??
                                0);
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
    final isResonRequired = controller.pollDetail.value.resonRequired ?? false;
    final isMultipleAnswer =
        controller.pollDetail.value.multipleAnswer ?? false;

    return Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: kBorderRadius15,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Text(
                    pollAnswer?.answerText ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 13),
                  )),
                  kWidth10,
                  Text(
                    '${pollAnswer?.answerVotes ?? 0} Vote${(pollAnswer?.answerVotes ?? 0) == 1 ? '' : 's'}',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 11),
                  )
                ],
              ),
            ),
          ),
        ),
        (pollAnswer?.supporters?.isEmpty ?? true) ? kempty : adjustHieght(10.h),
        (pollAnswer?.supporters?.isEmpty ?? true)
            ? kempty
            : AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: (pollAnswer?.supporters?.isEmpty ?? true) ? 0.h : 70.h,
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
                        Card(
                          elevation: 1,
                          child: Container(
                              height: 35.h,
                              width: 35.h,
                              decoration: BoxDecoration(
                                border: index != selectedIndex
                                    ? null
                                    : Border.all(color: neonShade),
                                borderRadius: kBorderRadius10,
                              ),
                              child: isAnonymous
                                  ? const Icon(Icons.person)
                                  : FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${pollAnswer?.supporters?[index].name?.substring(0, 2).toUpperCase()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 13),
                                      ),
                                    )),
                        ),
                        adjustHieght(3.h),
                        Text(
                          isAnonymous
                              ? "User"
                              : pollAnswer?.supporters?[index].name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        !isResonRequired ||
                isMultipleAnswer ||
                (pollAnswer?.supporters?.isEmpty ?? true)
            ? kempty
            : adjustHieght(5.h),
        !isResonRequired ||
                isMultipleAnswer ||
                (pollAnswer?.supporters?.isEmpty ?? true)
            ? kempty
            : SizedBox(
                height: 100.h,
                child: Stack(
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                        height: 100.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 10.h),
                        width: double.infinity,
                        decoration:
                            BoxDecoration(borderRadius: kBorderRadius10),
                        child: Column(children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                pollAnswer?.supporters?[selectedIndex].reason ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 13),
                              ),
                            ),
                          )
                        ]),
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
        !isResonRequired ||
                isMultipleAnswer ||
                (pollAnswer?.supporters?.isEmpty ?? true)
            ? kempty
            : adjustHieght(20.h)
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
        child: Card(
          child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor, borderRadius: kBorderRadius25),
              padding: EdgeInsets.all(8.w),
              child: Icon(left ? Icons.arrow_back : Icons.arrow_forward,
                  color: kblack)),
        ),
      ),
    );
  }
}
