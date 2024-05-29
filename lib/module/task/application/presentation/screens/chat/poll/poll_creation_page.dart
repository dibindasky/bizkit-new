import 'package:bizkit/module/task/application/presentation/screens/chat/poll/set_duration_dialog.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  bool anonymousVoting = false;
  bool multipleAnswers = false;
  bool mentionReason = false;
  bool pinPoll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Poll'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ListView(
          children: [
            const Text(
              'Your Question',
              style: TextStyle(color: klightgrey),
            ),
            TextFormField(
              controller: _questionController,
              decoration: const InputDecoration(
                hintText: 'Which quest should we take?',
                counterText: '124',
              ),
              maxLength: 124,
            ),
            adjustHieght(10.h),
            Row(
              children: [
                Text(
                  'Poll Options',
                  style: textStyle1.copyWith(color: klightgrey),
                ),
                const Spacer(),
                Text(
                  '${_optionsControllers.length}/10',
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
                        maxLength: 50,
                        controller: controller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.menu, color: klightgrey),
                          hintText: 'Option',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _optionsControllers.remove(controller);
                        });
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
            adjustHieght(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    if (_optionsControllers.length < 10) {
                      setState(() {
                        _optionsControllers.add(TextEditingController());
                      });
                    }
                  },
                  icon: const Icon(Icons.add_circle_outline, color: neonShade),
                  label: Text(
                    'ADD OPTION',
                    style: textStyle1.copyWith(color: neonShade),
                  ),
                ),
              ],
            ),
            // adjustHieght(10.h),
            const Divider(color: klightgrey),
            adjustHieght(10.h),
            Text('Settings', style: textStyle1),
            adjustHieght(10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('    Active Till', style: textHeadStyle1),
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const SetDurationDialogPolCreation(),
                          );
                        },
                        child: Text(
                          'Select Duration',
                          style: textStyle1.copyWith(color: neonShade),
                        )),
                  ],
                ),
                adjustHieght(3.h),
                Text(
                    'Set the duration of the quiz and this will also be visible to other.',
                    style: textStyle1.copyWith(color: klightgrey))
              ],
            ),
            const Divider(color: klightgrey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  title: Text('Anonymous Voting', style: textHeadStyle1),
                  value: anonymousVoting,
                  onChanged: (bool value) {
                    setState(() {
                      anonymousVoting = value;
                    });
                  },
                ),
                Text(
                    'If turned off then you will be able to see others responses. Others will also be able to see that the pole answers are anonymous or visible.',
                    style: textStyle1.copyWith(color: klightgrey))
              ],
            ),
            const Divider(color: klightgrey),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  title: Text('Multiple Answers', style: textHeadStyle1),
                  value: multipleAnswers,
                  onChanged: (bool value) {
                    setState(() {
                      multipleAnswers = value;
                    });
                  },
                ),
                Text('If turned on, users can vote multiple choice.',
                    style: textStyle1.copyWith(color: klightgrey))
              ],
            ),
            const Divider(color: klightgrey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                    title: Text('Mention Reason for the answer',
                        style: textHeadStyle1),
                    value: mentionReason,
                    onChanged: (bool value) {
                      setState(() {
                        mentionReason = value;
                      });
                    }),
                Text(
                    'If turned on, people can give reason why they are choosing option.',
                    style: textStyle1.copyWith(color: klightgrey))
              ],
            ),
            const Divider(color: klightgrey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  activeColor: neonShade,
                  title: Text('Pin the poll', style: textHeadStyle1),
                  value: pinPoll,
                  onChanged: (bool value) {
                    setState(() {
                      pinPoll = value;
                    });
                  },
                ),
                Text(
                    'If turned on, then the poll will be automatically be pinned at the topof the chat page.',
                    style: textStyle1.copyWith(color: klightgrey))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
