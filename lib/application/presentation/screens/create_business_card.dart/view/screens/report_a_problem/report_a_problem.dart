import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        title: Text(
          'Report a Problem',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: khieght * .74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  adjustHieght(kwidth * .03),
                  const Text('support@bizkit.com'),
                  adjustHieght(kwidth * .03),
                  const Text(
                      "Lörem ipsum mobilroman pack oktig pot. Begude pret, donat krofärad. Dopäse antropostat. Hälsolitteracitet antigisk pobande sall trefär. Autons guldomat. Gura trelig vad. Ofast jobb transtet nese prorere. Supägt maress as. Ban resade. Ytt lask speguskade, och euledes. Pseudohenerat timellare."),
                  adjustHieght(kwidth * .03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ColoredBox(
                            color: neonShade,
                            child: Image.asset(
                                'asset/images/roport_problem_camera_icon.png'),
                          ),
                        ),
                      ),
                      adjustWidth(kwidth * .03),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ColoredBox(
                            color: neonShade,
                            child: Image.asset(
                              'asset/images/report_problem_gallery_icon.png',
                            ),
                          ),
                        ),
                      ),
                      adjustWidth(kwidth * .03),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ColoredBox(
                            color: neonShade,
                            child: Image.asset(
                              'asset/images/reprort_problem_file_icon.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            LastSkipContinueButtons(
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
