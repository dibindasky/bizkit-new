import 'package:bizkit/module/biz_card/application/presentation/widgets/bizcard_widget.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, this.bizcard});

  final Bizcard? bizcard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: BizcardWidget(
            onTap: () {},
            width: 362.w,
            height: 260.h,
            designation: bizcard?.designation ?? 'designation',
            name: bizcard?.name ?? 'Jaisai Gopisetty',
            personImage: personDemoImg,
            qrScanner: 'asset/images/qr_image.jpeg',
          ),
        ),
        adjustHieght(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardEditIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Edit',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardPreviewIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Preview',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardShareIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Share',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 30.h,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: kBorderRadius10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.remove_red_eye_outlined),
                    Text(
                      '${bizcard?.views ?? 0}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      'views',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
            ),
            adjustWidth(5.w),
            Expanded(
              child: Container(
                height: 30.h,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: kBorderRadius10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.share_outlined),
                    Text(
                      '2,110',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      'shared',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
