import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BizcardDetailTopPotion extends StatelessWidget {
  const BizcardDetailTopPotion({
    super.key,
    required this.myCard,
  });

  final bool myCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bizcardBgImage), fit: BoxFit.cover)),
            height: 125.h,
            child: Column(
              children: [
                kHeight10,
                myCard
                    ? Row(
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
                              ),
                            ),
                          ),
                          kWidth10,
                          Text('Card',
                              style: Theme.of(context).textTheme.displayMedium)
                        ],
                      )
                    : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: const Icon(Icons.more_vert_rounded),
                        ),
                        kWidth10,
                      ]),
                kHeight5,
              ],
            ),
          ),
          const Align(
            child: CircleAvatar(
                radius: 50, backgroundImage: AssetImage(dummyPersonImage)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Jasai Gopisetty',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'UXUI Designer',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                kHeight20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
