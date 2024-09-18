import 'package:bizkit/module/attendence/application/presentation/screens/home/widgets/home_dialogs/time_management_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';

class OutsideOfficeDialog extends StatefulWidget {
  const OutsideOfficeDialog({super.key});

  @override
  _OutsideOfficeDialogState createState() => _OutsideOfficeDialogState();
}

class _OutsideOfficeDialogState extends State<OutsideOfficeDialog> {
  String? _selectedModeOfWork;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kblack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: 320.w,
        height: 360.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      clockInOutsideDialogimg,
                      width: 180,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                    adjustHieght(13.h),
                    Container(
                      width: 290.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: lightColr,
                        borderRadius: kBorderRadius5,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              _selectedModeOfWork ?? 'Mode of work',
                              style:
                                  const TextStyle(color: kwhite, fontSize: 14),
                            ),
                          ),
                          items: <String>[
                            'Work from home',
                            'Project Work',
                            'Field work',
                            'Other'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    color: kwhite, fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedModeOfWork = value;

                              Future.delayed(
                                const Duration(milliseconds: 700),
                                () {
                                  Navigator.of(context).pop();
                                  showTimeMangementDialog(context: context);
                                },
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    adjustHieght(16.h),
                    const Text(
                      'You’re outside the attendance area',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    adjustHieght(20.h),
                    const Text(
                      'Sorry, it looks like you are outside the office area. To continue, please do so with permission.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showOutSideOrOfficeDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const OutsideOfficeDialog();
    },
  );
}
