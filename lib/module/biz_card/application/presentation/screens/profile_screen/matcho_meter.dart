import 'package:bizkit/module/biz_card/application/presentation/widgets/custom_expanstion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CardMatchoMeter extends StatelessWidget {
  CardMatchoMeter({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matcho Meter'),
        backgroundColor: knill,
        scrolledUnderElevation: 0,
        forceMaterialTransparency: false,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 17)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(children: [
            ...List.generate(
                questions.length,
                (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.w),
                      child: CustomExpansionTile(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 300.w,
                                  child: CustomTextFormField(
                                    controller: textEditingController,
                                    padding: 4.w,
                                    labelText: 'Type Your answer',
                                  ),
                                ),
                                textEditingController.text.isNotEmpty
                                    ? Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: neonShade),
                                              borderRadius: kBorderRadius10),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add)),
                                        ),
                                      )
                                    : kempty
                              ],
                            )
                          ],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(questions[index]),
                          )),
                    ))
          ]),
        ),
      ),
    );
  }
}

List questions = [
  "What is your dream job?",
  "Where would you like to travel next?",
  "What is your favorite book?",
  "Who is your role model?",
  "What is your favorite movie?",
  "If you could have any superpower, what would it be?",
  "What is your favorite type of cuisine?",
  "What is the most exciting thing you've ever done?",
  "What do you like to do on weekends?",
  "What is your favorite season of the year?",
  "Which historical figure would you like to meet?",
  "What is your favorite kind of music?",
  "What was your favorite subject in school?",
  "If you could live in any country, where would it be?",
  "What is your favorite way to relax?",
  "What is the best gift you've ever received?",
  "What are your biggest strengths?",
  "If you could learn any new skill, what would it be?",
  "What is your favorite type of animal?",
  "What is one goal you hope to achieve this year?"
];
