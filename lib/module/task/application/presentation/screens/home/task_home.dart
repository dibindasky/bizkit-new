import 'package:bizkit/module/task/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/legends_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_creation_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';

class ScreenTaskHome extends StatelessWidget {
  const ScreenTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const TaskHomeAppBar(),
              adjustHieght(16),
              const TaskTextField(hintText: 'Find your task'),
              adjustHieght(16),
              const TaskCreationContainer(),
              adjustHieght(16),
              const LegendsContainer(),
              adjustHieght(40),
              const TaskContainers(),
              adjustHieght(70),
              Center(
                child: EventButton(
                  hieght: 45,
                  wdth: 200,
                  text: 'Generate Report',
                  onTap: () {
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return const ReportGenerator();
                    //   },
                    // );
                  },
                  color: const LinearGradient(
                    colors: [neonShade, neonShade],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
