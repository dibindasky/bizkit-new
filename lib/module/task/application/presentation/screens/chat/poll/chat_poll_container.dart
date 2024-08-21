import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/vote_poll.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PollContainerChat extends StatefulWidget {
  const PollContainerChat({super.key, required this.message});

  final Poll message;

  @override
  _PollContainerChatState createState() => _PollContainerChatState();
}

class _PollContainerChatState extends State<PollContainerChat> {
  List<String> selectedOption = [];
  String lastTapId = '';
  int totalVotes = 0;
  bool showTextField = false;
  bool completed = false;
  bool sender = false;
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    initilize();
    super.initState();
  }

  initilize() {
    sender = widget.message.sender;
    selectedOption.clear();
    totalVotes = 0;
    print('answer list :=> ${widget.message.pollAnswers?.length}');
    print(widget.message.toString());
    if (widget.message.pollAnswers != null) {
      for (var x in widget.message.pollAnswers!) {
        print('answer list :-> ${x.answerId} => ${x.supporters?.length}');
        if (x.supporters != null) {
          for (var y in x.supporters!) {
            if (y.userId == widget.message.currentUid) {
              completed = true;
              selectedOption.add(x.answerId ?? '');
              print('answered option id : ${x.answerId}');
            }
          }
        }
        totalVotes += x.answerVotes ?? 0;
      }
    }
    print(selectedOption);
    // Timer(const Duration(seconds: 1), () => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant PollContainerChat oldWidget) {
    print('didUpdateWidget 1');
    if (oldWidget.message != widget.message) {
      print('didUpdateWidget');
      initilize();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Padding(
      padding: EdgeInsets.only(
          top: 5.0.w,
          bottom: 5.0.w,
          left: sender ? 50.w : 0.w,
          right: !sender ? 50.w : 0.w),
      child: ClipPath(
        clipper: PollChatClipper(isSender: sender),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 300,
          padding: EdgeInsets.only(
              left: !sender ? 20.w : 10.w,
              right: sender ? 20.w : 10.w,
              top: 10.h,
              bottom: 10.h),
          decoration: BoxDecoration(
            color: sender ? neonShade.withGreen(190) : kwhite.withOpacity(0.3),
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
                child: Text(widget.message.pollQuestion ?? '',
                    style: textHeadStyle1.copyWith(
                        color: sender ? kblack : kwhite)),
              ),
              adjustHieght(2.h),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  widget.message.pollAnswers?.length ?? 0,
                  (index) {
                    final answer = widget.message.pollAnswers?[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Checkbox(
                              value: selectedOption
                                  .contains(answer?.answerId ?? ''),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedOption.add(answer?.answerId ?? '');
                                  } else {
                                    selectedOption
                                        .remove(answer?.answerId ?? '');
                                  }
                                  if (!(widget.message.resonRequired ?? true) &&
                                      !(widget.message.multipleAnswer ??
                                          true)) {
                                    controller.addVoteforPol(
                                      votePoll: VotePoll(
                                        answerIds: [answer?.answerId ?? ''],
                                        pollId: widget.message.pollId,
                                        reasons: {answer?.answerId ?? '': ''},
                                      ),
                                    );
                                  } else if (!(widget.message.multipleAnswer ??
                                      true)) {
                                    lastTapId = answer?.answerId ?? '';
                                    showTextField = true;
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50), // Makes the checkbox round
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                  color:
                                      kwhite, // Border color when not selected
                                  width: 2.0,
                                ),
                              ),
                              checkColor:
                                  kblack, // Set check mark color to black
                              activeColor:
                                  kwhite, // Set background color to white when selected
                            ),
                            title: Container(
                              padding: completed
                                  ? EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w)
                                  : null,
                              margin:
                                  EdgeInsets.only(right: completed ? 5.w : 0),
                              decoration: completed
                                  ? BoxDecoration(
                                      color: sender
                                          ? kblack.withOpacity(0.1)
                                          : kwhite.withOpacity(0.5),
                                      borderRadius: kBorderRadius5,
                                    )
                                  : null,
                              child: Text(
                                answer?.answerText ?? '',
                                style: textStyle1.copyWith(
                                    color: sender ? kblack : kwhite),
                              ),
                            ),
                          ),
                        ),
                        sender || completed
                            ? Center(
                                child: FittedBox(
                                  child: Text(
                                    "${answer?.answerVotes ?? 0}",
                                    style: textHeadStyle1,
                                  ),
                                ),
                              )
                            : kempty
                      ],
                    );
                  },
                ),
              ),
              (completed || selectedOption.isNotEmpty) && !showTextField
                  ? (widget.message.anonymousVote ?? false)
                      ? kempty
                      : Align(
                          child: GestureDetector(
                            onTap: () {
                              controller.pollDetail.value = widget.message;
                              GoRouter.of(context).pushNamed(
                                Routes.taskChatPollDetail,
                              );
                            },
                            child: Text(
                              'SEE VOTES',
                              style: textThinStyle1.copyWith(
                                color: kwhite.withOpacity(0.8),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        )
                  : !showTextField && !completed
                      ? kempty
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.h, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: kwhite, borderRadius: kBorderRadius10),
                          child: TextField(
                            maxLines: 3,
                            maxLength: 250,
                            controller: reasonController,
                            style: TextStyle(color: kblack, fontSize: 12.sp),
                            decoration: InputDecoration(
                              hintText: 'Let us know why ?',
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.addVoteforPol(
                                      votePoll: VotePoll(
                                        answerIds: [lastTapId],
                                        pollId: widget.message.pollId,
                                        reasons: {
                                          lastTapId: reasonController.text
                                        },
                                      ),
                                    );
                                    completed = true;
                                    showTextField = false;
                                  });
                                  reasonController.clear();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(5.w),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    child: ColoredBox(
                                      color: kblack,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.send,
                                            color: kwhite, size: 18.w),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
              adjustHieght(2.h),
              Row(
                children: [
                  Text(
                    '$totalVotes votes •',
                    style: textThinStyle1.copyWith(fontSize: 10.sp),
                  ),
                  const Spacer(),
                  Text(
                    DateTimeFormater.formatTimeAMPM(
                        widget.message.timestamp ?? ''),
                    style: textThinStyle1.copyWith(
                        color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                  ),
                  sender ? kWidth10 : kempty,
                  sender
                      ? MessageReadMarker(read: widget.message.readByAll)
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
