// import 'package:flutter/material.dart';

// class AttendenceCalenderScreen extends StatelessWidget {
//   const AttendenceCalenderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const SafeArea(
//         child: Center(child: Text('Attendence Calender Screen')),
//       ),
//     );
//   }
// }
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/calender_widget.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/upcoming_leaves_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceCalenderScreen extends StatelessWidget {
  const AttendenceCalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back(id: 22);
          },
        ),
        title: Text(
          'Calendar',
          style: textThinStyle1.copyWith(fontSize: 16),
        ),
        backgroundColor: kblack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: kgrey, width: 1),
              borderRadius: kBorderRadius15),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CalendarWidget(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UpcomingLeavesWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
