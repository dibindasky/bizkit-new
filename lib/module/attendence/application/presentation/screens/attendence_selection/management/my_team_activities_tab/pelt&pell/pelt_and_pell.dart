import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/pelt_and_pell_appbar.dart';

class AttendenceMsPeltAndPellScreen extends StatefulWidget {
  const AttendenceMsPeltAndPellScreen({super.key});

  @override
  State<AttendenceMsPeltAndPellScreen> createState() =>
      _AttendenceMsPeltAndPellScreenState();
}

class _AttendenceMsPeltAndPellScreenState
    extends State<AttendenceMsPeltAndPellScreen> {
  String? selectDepartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              const AttendenceMsPeltAndPellAppbar(title: 'PELT&PELL'),
              adjustHieght(15.h),
              Container(
                width: 320.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: kgrey),
                  borderRadius: kBorderRadius15,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Text(
                        selectDepartment ?? 'Select Department',
                        style: const TextStyle(
                          color: kwhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    items: <String>[
                      'Hr',
                      'Development',
                      'Test',
                      'Other',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: kwhite, fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectDepartment = value;
                      });
                    },
                  ),
                ),
              ),
              adjustHieght(20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: lightColr,
                        borderRadius: kBorderRadius10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  demoPerosnImgPeltandpell,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Olivia Williams (uxui designer)',
                                    style: TextStyle(
                                      color: kneonShade,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'LOCATION',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: neonShade,
                                        ),
                                      ),
                                      adjustWidth(10.w),
                                      const Text(
                                        'LOGIN TIME',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: neonShade,
                                        ),
                                      ),
                                      adjustWidth(10.w),
                                      const Text(
                                        'LOGOUT TIME',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: neonShade,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Bangalore',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      adjustWidth(15.w),
                                      const Text(
                                        '9:00',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      adjustWidth(55.w),
                                      const Text(
                                        '6:00',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          EventButton(
                            color: const LinearGradient(colors: [
                              neonShade,
                              neonShade,
                            ]),
                            width: 300.w,
                            text: 'Change PELT / PELL',
                            textColr: kblack,
                            onTap: () {
                              Get.toNamed(Routes.attendenceMsChangePeltAndPell,
                                  id: 22);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
