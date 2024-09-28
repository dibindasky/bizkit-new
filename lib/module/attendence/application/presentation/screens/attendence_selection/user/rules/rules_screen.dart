import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/rules/widgets/category_buttons.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/rules/widgets/rule_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceRulesScreen extends StatelessWidget {
  const AttendenceRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back(id: 22);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        'Rules',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              adjustHieght(16),
              const CategoryButtons(),
              adjustHieght(16),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return RuleCard(ruleNumber: index + 1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
