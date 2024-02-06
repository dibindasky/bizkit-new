import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/card_uploading_showdailogue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/profile_creation/profile_creation.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartingBusinessCardCreation extends StatefulWidget {
  const StartingBusinessCardCreation({super.key});

  @override
  State<StartingBusinessCardCreation> createState() =>
      _StartingBusinessCardCreationState();
}

class _StartingBusinessCardCreationState
    extends State<StartingBusinessCardCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColour,
        title: Text(
          'Business Card',
          style: textHeadStyle1,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: khieght * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cardscanimagesSelectingDailogue(context);
                      },
                      child: DottedBorder(
                        dashPattern: const [8, 8],
                        color: neonShade,
                        strokeWidth: 2.5,
                        child: SizedBox(
                          width: kwidth * 0.8,
                          height: kwidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                              Text(
                                'Scan Card',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        fadePageRoute(const ProfileScreen()),
                      ),
                      child: Text(
                        'Create Card manually',
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    fadePageRoute(const BizkitBottomNavigationBar()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: neonShade,
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
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
