import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelSharing extends StatelessWidget {
  const LevelSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Level Sharing',
          style: appBarHeading1,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                adjustHieght(khieght * .03),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    height: 57.dm,
                    width: 300.dm,
                    decoration: BoxDecoration(
                      border: Border.all(color: kwhite),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Level Sharing',
                              style: TextStyle(fontSize: kwidth * 0.037),
                            ),
                            Text(
                              'Professional, Emergency, Company',
                              style: TextStyle(
                                fontSize: kwidth * 0.027,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: kwhite,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                adjustHieght(khieght * .04),
                const SwitchButtons(),
                adjustHieght(khieght * .02),
                AuthButton(
                  wdth: 100,
                  text: 'Save',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                adjustHieght(khieght * .04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchButtons extends StatefulWidget {
  const SwitchButtons({super.key});

  @override
  State<SwitchButtons> createState() => _SwitchButtonsState();
}

class _SwitchButtonsState extends State<SwitchButtons> {
  bool personalDetals = false;
  bool personalDetals1 = false;
  bool personalDetals2 = false;
  bool personalDetals3 = false;

  bool businessDetals = false;
  bool businessDetals1 = false;
  bool businessDetals2 = false;
  bool businessDetals3 = false;
  bool businessDetals4 = false;
  bool businessDetals5 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSwitch("Personal Details", personalDetals, (value) {
          setState(() {
            personalDetals = value;
            // If "Personal Details" is false, disable other switches
            if (!value) {
              personalDetals1 = false;
              personalDetals2 = false;
              personalDetals3 = false;
            }
          });
        }),
        buildSwitch("Name", personalDetals1, (value) {
          setState(() {
            if (personalDetals) {
              personalDetals1 = value;
            }
          });
        }),
        buildSwitch("Mail ID", personalDetals2, (value) {
          setState(() {
            if (personalDetals) {
              personalDetals2 = value;
            }
          });
        }),
        buildSwitch("Personal Details three", personalDetals3, (value) {
          setState(() {
            if (personalDetals) {
              personalDetals3 = value;
            }
          });
        }),
        adjustHieght(khieght * .02),
        buildSwitch("Business Details", businessDetals, (value) {
          setState(() {
            businessDetals = value;
            // If "Personal Details" is false, disable other switches
            if (!value) {
              businessDetals1 = false;
              businessDetals2 = false;
              businessDetals3 = false;
              businessDetals4 = false;
              businessDetals5 = false;
            }
          });
        }),
        buildSwitch("Name", businessDetals1, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals1 = value;
            }
          });
        }),
        buildSwitch("Company name", businessDetals2, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals2 = value;
            }
          });
        }),
        buildSwitch("Company Mail", businessDetals3, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals3 = value;
            }
          });
        }),
        buildSwitch("Address", businessDetals4, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals4 = value;
            }
          });
        }),
        buildSwitch("Licence", businessDetals5, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals4 = value;
            }
          });
        }),
        buildSwitch("Licence", businessDetals5, (value) {
          setState(() {
            if (businessDetals) {
              businessDetals4 = value;
            }
          });
        }),
      ],
    );
  }

  Widget buildSwitch(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: textFieldFillColr,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label == "Personal Details" || label == "Business Details"
                ? Text(
                    label,
                    style: TextStyle(
                      fontSize: kwidth * 0.043,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(
                      color: klightgrey,
                      fontSize: kwidth * 0.033,
                    ),
                  ),
            Switch(
              inactiveTrackColor: textFieldFillColr,
              inactiveThumbColor: kwhite,
              activeTrackColor: neonShade,
              activeColor: kwhite,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
