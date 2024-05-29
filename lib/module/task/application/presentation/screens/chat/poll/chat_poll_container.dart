import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PollContainerChat extends StatefulWidget {
  const PollContainerChat({super.key, required this.isSender});

  final bool isSender;

  @override
  _PollContainerChatState createState() => _PollContainerChatState();
}

class _PollContainerChatState extends State<PollContainerChat> {
  int selectedOption = -1;
  bool optionSelected = false;
  bool completed = false;
  List<String> answers = [
    'Complete Development',
    'Finish Task module',
    'Take rest'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 5.0.w,
          bottom: 5.0.w,
          left: widget.isSender ? 50.w : 0.w,
          right: !widget.isSender ? 50.w : 0.w),
      child: ClipPath(
        clipper: PollChatClipper(isSender: widget.isSender),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 300,
          padding: EdgeInsets.only(
              left: !widget.isSender ? 20.w : 10.w,
              right: widget.isSender ? 20.w : 10.w,
              top: 10.h,
              bottom: 10.h),
          decoration: BoxDecoration(
            color: widget.isSender
                ? neonShade.withOpacity(0.8)
                : kwhite.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: kblack.withOpacity(0.1),
                    borderRadius: kBorderRadius5),
                child: Text(
                  'Which quest should we take?',
                  style: textHeadStyle1.copyWith(color: kblack),
                ),
              ),
              adjustHieght(2.h),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  answers.length,
                  (index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RadioListTile<int>(
                          contentPadding: EdgeInsets.zero,
                          activeColor: kwhite,
                          title: Container(
                            padding: completed
                                ? EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w)
                                : null,
                            margin: EdgeInsets.only(right: completed ? 5.w : 0),
                            decoration: completed
                                ? BoxDecoration(
                                    color: widget.isSender
                                        ? kblack.withOpacity(0.1)
                                        : kwhite.withOpacity(0.5),
                                    borderRadius: kBorderRadius5)
                                : null,
                            child: Text(answers[index],
                                style: textStyle1.copyWith(
                                    color: completed && selectedOption != index
                                        ? kgrey
                                        : kblack)),
                          ),
                          value: index,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              if (completed) {
                                return;
                              }
                              selectedOption = value!;
                              if (selectedOption != -1) {
                                optionSelected = true;
                              }
                            });
                          },
                        ),
                      ),
                      completed
                          ? SizedBox(
                              width: 50.w,
                              height: 50.w,
                              child: Stack(
                                children: List.generate(
                                  3,
                                  (index) => Positioned(
                                    left: 5.w * index,
                                    child: CircleAvatar(
                                      backgroundColor: kgrey,
                                      backgroundImage:
                                          const AssetImage(imageDummyAsset),
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            "${index + 1}",
                                            style: textHeadStyle1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : kempty
                    ],
                  ),
                ),
              ),
              completed
                  ? Align(
                      child: GestureDetector(
                        onTap: () {
                          // show poll detail page
                        },
                        child: Text(
                          'SEE VOTES',
                          style: textHeadStyle1.copyWith(
                            color: kwhite.withOpacity(0.8),
                          ),
                        ),
                      ),
                    )
                  : !optionSelected
                      ? kempty
                      : TaskTextField(
                          maxLines: 4,
                          fillColor: kwhite,
                          textColor: kblack,
                          hintText: 'Let us know why',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                completed = true;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: ColoredBox(
                                  color: kblack,
                                  child: Icon(Icons.send,
                                      color: kwhite, size: 15.w),
                                ),
                              ),
                            ),
                          ),
                        ),
              adjustHieght(5.h),
              Row(
                children: [
                  Text(
                    '0 votes • 24 hrs left',
                    style: textStyle1,
                  ),
                  const Spacer(),
                  Text(
                    '10:20',
                    style: textStyle1.copyWith(
                        color: widget.isSender ? kgrey : klightgrey),
                  ),
                  widget.isSender ? kWidth10 : kempty,
                  widget.isSender
                      ? SizedBox(
                          height: 15.sp,
                          width: 15.sp,
                          child: const FittedBox(
                            child: Stack(
                              children: [
                                Icon(Icons.check, color: kblue),
                                Positioned(
                                    left: 5,
                                    child: Icon(Icons.check, color: kblue)),
                              ],
                            ),
                          ),
                        )
                      : kempty
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
