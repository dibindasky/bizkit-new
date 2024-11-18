import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BizcardCreateScreen extends StatelessWidget {
  const BizcardCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Column(
                children: [
                  kHeight5,
                  Row(
                    children: [
                      kWidth20,
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.sp,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      kWidth10,
                      Text('Create Card',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  kHeight5,
                ],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          bizcardCreateDummy,
                          height: 150.h,
                        ),
                        kHeight20,
                        Text(
                          'Upload a copy of your visiting card to get the \ndetails prefilled without registering.',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColoredBox(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: SizedBox(
                        height: 20.h,
                        width: double.infinity,
                      ),
                    ),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: SizedBox(
                        height: 20.h,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                        color: Theme.of(context).colorScheme.surface),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    height: 50,
                    // width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.camera_alt_rounded),
                        kWidth5,
                        const Text('Use Camera')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kempty,
                Container(
                  margin: const EdgeInsets.all(40),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: kGrayLight, borderRadius: kBorderRadius10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 35.h),
                      kWidth5,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select the card from gallery',
                                style: Theme.of(context).textTheme.titleSmall),
                            Text(
                              'Upload a copy of your visiting card to get the details prefilled without registering.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 8.h),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EventButton(
                      text: 'Next',
                      showGradiant: false,
                      width: double.infinity,
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.cardCreationDetailAdding);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
