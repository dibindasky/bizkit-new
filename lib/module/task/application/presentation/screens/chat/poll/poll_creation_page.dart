import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/set_duration_dialog.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/create_poll.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenPollCreation extends StatefulWidget {
  const ScreenPollCreation({super.key});

  @override
  State<ScreenPollCreation> createState() => _ScreenPollCreationState();
}

class _ScreenPollCreationState extends State<ScreenPollCreation> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> durations = ['Next 1 hour', '24 hours', '1 week', 'Always'];

  bool anonymousVoting = false;
  bool multipleAnswers = false;
  bool mentionReason = false;
  bool pinPoll = false;
  int? activeUntil;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: knill,
        title: Text(
          'Create Poll',
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            DateTime date = DateTime.now();
            if (activeUntil == 1 || activeUntil == null) {
              date = date.add(const Duration(days: 1));
            } else if (activeUntil == 2) {
              date = date.add(const Duration(days: 7));
            } else if (activeUntil == 0) {
              date = date.add(const Duration(hours: 1));
            }
            CreatePoll createPoll = CreatePoll(
                messageType: 'create_poll',
                question: _questionController.text,
                isAnonymousVotingAllowed: anonymousVoting,
                isMultipleSelectionAllowed: multipleAnswers,
                isReasonRequired: mentionReason,
                activeUntil: activeUntil == 3 ? 'Always' : date.toString(),
                answers: List.generate(_optionsControllers.length,
                    (x) => _optionsControllers[x].text));
            controller.createPollVoting(createPoll: createPoll);
            GoRouter.of(context).pop();
          }
        },
        icon: Text('Create',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 14)),
        label: const Icon(Icons.add, size: 25),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Text(
                'Your Question',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 13),
              ),
              TextFormField(
                style: Theme.of(context).textTheme.displaySmall,
                textCapitalization: TextCapitalization.sentences,
                controller: _questionController,
                decoration: InputDecoration(
                  hintText: 'Which quest should we take?',
                  hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: kgrey,
                      ),

                  // counterText: '124',
                ),
                maxLength: 124,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'enter poll title/question.';
                  }
                  return null;
                },
              ),
              adjustHieght(10.h),
              Row(
                children: [
                  Text(
                    'Poll Options',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 13),
                  ),
                  const Spacer(),
                  Text(
                    '${_optionsControllers.length}/6',
                    style: textStyle1.copyWith(color: neonShade),
                  )
                ],
              ),
              Column(
                children: _optionsControllers.map((controller) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          maxLength: 50,
                          controller: controller,
                          style: Theme.of(context).textTheme.displaySmall,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.menu, color: kGreyNormal),
                            hintText: 'Option',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: kGreyNormal,
                                ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'option cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      _optionsControllers.length > 2
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _optionsControllers.remove(controller);
                                });
                              },
                            )
                          : kWidth20,
                    ],
                  );
                }).toList(),
              ),
              adjustHieght(8.h),
              _optionsControllers.length < 7
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            if (_optionsControllers.length < 10) {
                              setState(() {
                                _optionsControllers
                                    .add(TextEditingController());
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline,
                              color: neonShade),
                          label: Text(
                            'ADD OPTION',
                            style: textStyle1.copyWith(color: neonShade),
                          ),
                        ),
                      ],
                    )
                  : kempty,
              _optionsControllers.length < 7
                  ? const Divider(color: kGreyNormal)
                  : kempty,
              adjustHieght(10.h),
              Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 16),
              ),
              adjustHieght(10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '    Active Till',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  SetDurationDialogPolCreation(
                                durations: durations,
                                onSelection: (value) {
                                  activeUntil = value;
                                  setState(() {});
                                },
                              ),
                            );
                          },
                          child: Text(
                            activeUntil != null
                                ? durations[activeUntil!]
                                : 'Select Duration',
                            style: textStyle1.copyWith(color: neonShade),
                          )),
                    ],
                  ),
                  adjustHieght(3.h),
                  Text(
                    'Set the duration of the quiz and this will also be visible to other.',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: kgrey),
                  )
                ],
              ),
              const Divider(color: kGreyNormal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    splashRadius: double.minPositive,
                    title: Text(
                      'Anonymous Voting',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 15),
                    ),
                    value: anonymousVoting,
                    onChanged: (bool value) {
                      setState(() {
                        anonymousVoting = value;
                      });
                    },
                  ),
                  Text(
                    'If turned off then you will be able to see others responses. Others will also be able to see that the pole answers are anonymous or visible.',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: kgrey),
                  )
                ],
              ),
              const Divider(color: kGreyNormal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    splashRadius: double.minPositive,
                    title: Text(
                      'Multiple Answers',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 15),
                    ),
                    value: multipleAnswers,
                    onChanged: (bool value) {
                      setState(() {
                        multipleAnswers = value;
                        if (multipleAnswers) {
                          mentionReason = false;
                        }
                      });
                    },
                  ),
                  Text(
                    'If turned on, users can vote multiple choice.',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: kgrey),
                  )
                ],
              ),
              const Divider(color: kGreyNormal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                      splashRadius: double.minPositive,
                      title: Text(
                        'Mention Reason for the answer',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 15),
                      ),
                      value: mentionReason,
                      onChanged: (bool value) {
                        setState(() {
                          mentionReason = value;
                          if (mentionReason) {
                            multipleAnswers = false;
                          }
                        });
                      }),
                  Text(
                    'If turned on, people can give reason why they are choosing option.',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: kgrey),
                  )
                ],
              ),
              const Divider(color: kGreyNormal),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     SwitchListTile(
              //       title: Text('Pin the poll', style: textHeadStyle1),
              //       value: pinPoll,
              //       onChanged: (bool value) {
              //         setState(() {
              //           pinPoll = value;
              //         });
              //       },
              //     ),
              //     Text(
              //         'If turned on, then the poll will be automatically be pinned at the topof the chat page.',
              //         style: textStyle1.copyWith(color: klightgrey))
              //   ],
              // ),
              kHeight50,
              kHeight50,
            ],
          ),
        ),
      ),
    );
  }
}
