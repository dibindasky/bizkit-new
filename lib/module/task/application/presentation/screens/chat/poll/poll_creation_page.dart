import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

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
        title: Text('Create Poll'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Handle poll creation
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Your Question',
              style: TextStyle(color: Colors.grey),
            ),
            TextFormField(
              controller: _questionController,
              decoration: InputDecoration(
                hintText: 'Which quest should we take?',
                counterText: '124',
              ),
              maxLength: 124,
            ),
            SizedBox(height: 16),
            Text(
              'Poll Options',
              style: TextStyle(color: Colors.grey),
            ),
            Column(
              children: _optionsControllers.map((controller) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Option',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_optionsControllers.length}/10'),
                TextButton(
                  onPressed: () {
                    if (_optionsControllers.length < 10) {
                      setState(() {
                        _optionsControllers.add(TextEditingController());
                      });
                    }
                  },
                  child: Text(
                    'ADD OPTION',
                    style: TextStyle(color: kwhite),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            ListTile(
              title: Text('Active Till'),
              trailing: TextButton(
                onPressed: () {
                  // Handle duration selection
                },
                child: Text(
                  'Select Duration',
                  style: TextStyle(color: kwhite),
                ),
              ),
            ),
            SwitchListTile(
              title: Text('Anonymous Voting'),
              value: anonymousVoting,
              onChanged: (bool value) {
                setState(() {
                  anonymousVoting = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Multiple Answers'),
              value: multipleAnswers,
              onChanged: (bool value) {
                setState(() {
                  multipleAnswers = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Mention Reason for the answer'),
              value: mentionReason,
              onChanged: (bool value) {
                setState(() {
                  mentionReason = value;
                });
              },
              subtitle: mentionReason
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'If turned on, people can give reason why they are choosing option',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : null,
            ),
            SwitchListTile(
              title: Text('Pin the poll'),
              value: pinPoll,
              onChanged: (bool value) {
                setState(() {
                  pinPoll = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
