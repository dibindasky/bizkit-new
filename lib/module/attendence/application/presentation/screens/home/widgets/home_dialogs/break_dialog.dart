import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../utils/widgets/event_button.dart';

class ShowBreakDialog extends StatefulWidget {
  const ShowBreakDialog({super.key});

  @override
  ShowBreakDialogSate createState() => ShowBreakDialogSate();
}

class ShowBreakDialogSate extends State<ShowBreakDialog> {
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
        height: 330.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      takeBreakDialogimg,
                      width: 210,
                      height: 240,
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
                              _selectedModeOfWork ?? 'What kind of break ?',
                              style:
                                  const TextStyle(color: kwhite, fontSize: 14),
                            ),
                          ),
                          items: <String>[
                            'Coffee break at 10:00 AM.',
                            'Lunch break is from 1:00 PM',
                            'Coffee break at 4:00 PM.',
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
                                const Duration(seconds: 1),
                                () {},
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    adjustHieght(16.h),
                    EventButton(
                      color: const LinearGradient(
                        colors: [
                          neonShade,
                          neonShade,
                        ],
                      ),
                      text: 'Apply',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      wdth: 300.w,
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

showBreakDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ShowBreakDialog();
    },
  );
}
