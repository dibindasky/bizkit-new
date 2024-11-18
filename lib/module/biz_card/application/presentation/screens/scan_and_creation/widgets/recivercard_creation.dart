import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class RecivercardCreation extends StatelessWidget {
  const RecivercardCreation({
    super.key,
    this.onPressedCam,
    this.onPressedGallery,
  });
  final VoidCallback? onPressedCam;
  final VoidCallback? onPressedGallery;

  @override
  Widget build(BuildContext context) {
        final textExtractionController = Get.find<CardTextExtractionController>();
    final receivedCardController = Get.find<ReceivedCardController>();
    return Column(
      children: [
        Stack(
          children: [
            SizedBox( 
              height: 250.h, 
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
              child: GestureDetector(
                onTap: onPressedGallery,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: kBorderRadius10,
                      color: Theme.of(context).colorScheme.surface),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kempty,
            GestureDetector(
              onTap: onPressedGallery,
              child: Container(
                
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
            ),
            // Text('ydjhd',style: TextStyle(color: Colors.amber),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: EventButton(
                  text: 'Create card without image',
                  showGradiant: false,
                  width: double.infinity,
                  onTap: () {
                         textExtractionController.pickedImageUrl.clear();
                                receivedCardController
                                    .clearAllTextEditingControllers();
                                GoRouter.of(context)
                                    .pushNamed(Routes.scanedDataFeilds);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
