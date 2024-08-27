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
  late Poll message;
  List<String> selectedOption = [];
  String lastTapId = '';
  int totalVotes = 0;
  bool showTextField = false;
  bool completed = false;
  bool sender = false;
  int? time;
  bool expired = false;
  final TextEditingController reasonController = TextEditingController();
  final controller = Get.find<ChatController>();

  @override
  void initState() {
    initilize();
    super.initState();
  }

  void markAnswer([String? reason]) {
    Map<String, String> reasons = {};
    for (var e in selectedOption) {
      reasons[e] = reason ?? '';
    }
    // message=widget.message.copyWith(pollAnswers:(widget.message.pollAnswers??[]) );
    controller.addVoteforPol(
      votePoll: VotePoll(
        answerIds: selectedOption,
        pollId: message.pollId,
        reasons: reasons,
      ),
    );
  }

  timerCheck() async {
    await Future.delayed(Duration(seconds: time ?? 0));
    setState(() {
      time = -1;
      expired = true;
    });
  }

  initilize() {
    message = widget.message;
    sender = message.sender;
    selectedOption.clear();
    totalVotes = 0;
    if (message.pollAnswers != null) {
      for (var x in message.pollAnswers!) {
        if (x.supporters != null) {
          for (var y in x.supporters!) {
            if (y.userId == message.currentUid) {
              completed = true;
              selectedOption.add(x.answerId ?? '');
            }
          }
        }
        totalVotes += x.answerVotes ?? 0;
      }
    }
    time = DateTimeFormater.countdownInSeconds(message.activeUntil ?? '');
    if (message.activeUntil == '' || message.activeUntil == 'Alwase') {
      expired = false;
    } else if (time != null && time! > 0) {
      timerCheck();
    } else {
      expired = true;
    }
  }

  @override
  void didUpdateWidget(covariant PollContainerChat oldWidget) {
    if (oldWidget.message != widget.message) {
      initilize();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                decoration: BoxDecoration(
                    color: kblack.withOpacity(0.1),
                    borderRadius: kBorderRadius5),
                child: Text(message.pollQuestion ?? '',
                    style: textStyle1.copyWith(color: kwhite)),
              ),
              adjustHieght(2.h),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  message.pollAnswers?.length ?? 0,
                  (index) {
                    final answer = message.pollAnswers?[index];
                    final selected =
                        selectedOption.contains(answer?.answerId ?? '');
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Checkbox
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kwhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(
                                        500.0), // To match the round checkbox
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!expired) {
                                        setState(() {
                                          if (message.multipleAnswer ?? false) {
                                            if (selectedOption.contains(
                                                answer?.answerId ?? '')) {
                                              selectedOption.remove(
                                                  answer?.answerId ?? '');
                                            } else {
                                              selectedOption
                                                  .add(answer?.answerId ?? '');
                                            }
                                          } else {
                                            if (selectedOption.contains(
                                                answer?.answerId ?? '')) {
                                              selectedOption = [];
                                            } else {
                                              selectedOption = [
                                                answer?.answerId ?? ''
                                              ];
                                            }
                                          }
                                          if (message.multipleAnswer ?? false) {
                                            markAnswer();
                                          } else if (message.resonRequired ??
                                              false) {
                                            lastTapId = answer?.answerId ?? '';
                                            showTextField = true;
                                          } else {
                                            markAnswer();
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedOption.contains(
                                                answer?.answerId ?? '')
                                            ? kwhite
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            50), // Matching rounded corners
                                      ),
                                      padding: EdgeInsets.all(selected
                                          ? 0
                                          : 8.0), // Adjust padding to center the checkmark
                                      child: selected
                                          ? const Icon(
                                              Icons.check,
                                              color: kblack,
                                              size: 15,
                                            )
                                          : null, // No icon if not selected
                                    ),
                                  ),
                                ),kWidth10,
                                Expanded(
                                  child: Container(
                                    padding: completed
                                        ? EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 8.w)
                                        : null,
                                    margin: EdgeInsets.only(
                                        right: completed ? 5.w : 0),
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
                                      style: textThinStyle1.copyWith(
                                          color: kwhite),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sender || completed
                            ? Center(
                                child: FittedBox(
                                  child: Text(
                                    "${answer?.answerVotes ?? 0}",
                                    style: textStyle1,
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
                  ? Align(
                      child: GestureDetector(
                        onTap: () {
                          controller.pollDetail.value = message;
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
                                    markAnswer(reasonController.text);
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
                    '$totalVotes votes • ${expired ? 'Expired' : 'Active'}',
                    style: textThinStyle1.copyWith(fontSize: 10.sp),
                  ),
                  const Spacer(),
                  Text(
                    DateTimeFormater.formatTimeAMPM(message.timestamp ?? ''),
                    style: textThinStyle1.copyWith(
                        color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                  ),
                  sender ? kWidth10 : kempty,
                  sender ? MessageReadMarker(read: message.readByAll) : kempty
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
