// import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/constants/contants.dart';
// import 'package:bizkit/utils/intl/intl_date_formater.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// class TaskTotalTimeAndExpenseView extends StatelessWidget {
//   const TaskTotalTimeAndExpenseView(
//       {super.key, this.isTotalTimeOrExpense = false});

//   final bool? isTotalTimeOrExpense;

//   @override
//   Widget build(BuildContext context) {
//     final taskController = Get.find<CreateTaskController>();
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         backgroundColor: knill,
//         title: Text(
//           isTotalTimeOrExpense == true
//               ? 'Total Time on the task'
//               : 'Total Expense on the task',
//           style: textHeadStyle1,
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             children: [
//               adjustHieght(10.h),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: kBorderRadius15,
//                     color: klightDarkGrey,
//                     border: Border.all(color: neonShade)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(9.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           isTotalTimeOrExpense == true
//                               ? CircleAvatar(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(1.w),
//                                     child: const CircleAvatar(
//                                       backgroundColor: klightDarkGrey,
//                                       child: Icon(
//                                         Icons.access_time_filled_sharp,
//                                         color: neonShade,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : CircleAvatar(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(1.w),
//                                     child: CircleAvatar(
//                                         backgroundColor: lightGrey,
//                                         child: Image.asset(
//                                           width: 20.w,
//                                           taskExpenseIconImage,
//                                         )),
//                                   ),
//                                 ),
//                           adjustWidth(10.w),
//                           Text(isTotalTimeOrExpense == true
//                               ? 'Total Time'
//                               : 'Total Expense'),
//                         ],
//                       ),
//                       Text(
//                         isTotalTimeOrExpense == true
//                             ? DateTimeFormater.convertMinutesToHourMinuteFormat(
//                                 taskController.singleTask.value.totalTime ?? 0)
//                             : '₹${taskController.singleTask.value.totalExpense}',
//                         style: textHeadStyle1.copyWith(color: neonShade),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               adjustHieght(10.h),
//               SizedBox(
//                 height: khieght,
//                 child: Expanded(
//                   child: ListView.builder(
//                     itemCount: taskController.taskTotalTime.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         leading: const CircleAvatar(
//                             child: Image(image: AssetImage(personDemoImg))),
//                         title: Text(
//                           taskController.taskTotalTime[index].name ??
//                               'Savannah Nguyen',
//                           style: textThinStyle1,
//                         ),
//                         trailing: isTotalTimeOrExpense == true
//                             ? Text(
//                                 DateTimeFormater
//                                     .convertMinutesToHourMinuteFormat(
//                                         taskController.taskTotalTime[index]
//                                                 .totalTime ??
//                                             0),
//                                 style:
//                                     textThinStyle1.copyWith(color: neonShade),
//                               )
//                             : Text(
//                                 '₹ ${taskController.taskTotalTime[index].totalExpense}',
//                                 style:
//                                     textThinStyle1.copyWith(color: neonShade),
//                               ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskTotalTimeAndExpenseView extends StatelessWidget {
  const TaskTotalTimeAndExpenseView(
      {super.key, this.isTotalTimeOrExpense = false});

  final bool? isTotalTimeOrExpense;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: Text(
          isTotalTimeOrExpense == true
              ? 'Total Time on the task'
              : 'Total Expense on the task',
          style: textHeadStyle1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              adjustHieght(10.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: kBorderRadius15,
                    color: klightDarkGrey,
                    border: Border.all(color: neonShade)),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          isTotalTimeOrExpense == true
                              ? CircleAvatar(
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: const CircleAvatar(
                                      backgroundColor: klightDarkGrey,
                                      child: Icon(
                                        Icons.access_time_filled_sharp,
                                        color: neonShade,
                                      ),
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: CircleAvatar(
                                        backgroundColor: lightGrey,
                                        child: Image.asset(
                                          width: 20.w,
                                          taskExpenseIconImage,
                                        )),
                                  ),
                                ),
                          adjustWidth(10.w),
                          Text(isTotalTimeOrExpense == true
                              ? 'Total Time'
                              : 'Total Expense'),
                        ],
                      ),
                      Text(
                        isTotalTimeOrExpense == true
                            ? DateTimeFormater.convertMinutesToHourMinuteFormat(
                                taskController.singleTask.value.totalTime ?? 0)
                            : '₹${taskController.singleTask.value.totalExpense ?? 0}',
                        style: textHeadStyle1.copyWith(color: neonShade),
                      )
                    ],
                  ),
                ),
              ),
              adjustHieght(10.h),
              SizedBox(
                height: khieght,
                child: ListView.builder(
                  itemCount: isTotalTimeOrExpense == true
                      ? taskController.taskTotalTime.length
                      : taskController.taskExpense.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: klightDarkGrey,
                      child: ListTile(
                        leading: const CircleAvatar(
                            child: Image(image: AssetImage(personDemoImg))),
                        title: Text(
                          isTotalTimeOrExpense == true
                              ? taskController.taskTotalTime[index].name ??
                                  'name'
                              : taskController.taskExpense[index].name ??
                                  'name',
                          style: textThinStyle1,
                        ),
                        trailing: isTotalTimeOrExpense == true
                            ? Text(
                                DateTimeFormater
                                    .convertMinutesToHourMinuteFormat(
                                        taskController.taskTotalTime[index]
                                                .totalTime ??
                                            0),
                                style:
                                    textThinStyle1.copyWith(color: neonShade),
                              )
                            : Text(
                                '₹ ${taskController.taskExpense[index].totalExpense ?? 0}',
                                style:
                                    textThinStyle1.copyWith(color: neonShade),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}