import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardDeatilWebsiteDialoge extends StatelessWidget {
  const BizcardDeatilWebsiteDialoge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: cardController.bizcardDetail.value.businessDetails != null &&
                cardController
                        .bizcardDetail.value.businessDetails?.websiteLink !=
                    null
            ? [
                Text('Website Link',
                    style: Theme.of(context).textTheme.displaySmall),
                kHeight10,
                Text(
                  cardController
                      .bizcardDetail.value.businessDetails!.websiteLink!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 13.sp),
                ),
                kHeight10,
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        onPressed: () async {
                          await LaunchUrl.googleSearch(
                            url: cardController.bizcardDetail.value
                                .businessDetails!.websiteLink!,
                          ).then(
                            (value) => GoRouter.of(context).pop(),
                          );
                        },
                        icon: Icon(Icons.open_in_browser_outlined,
                            color: Theme.of(context).colorScheme.surface),
                        label: Text(
                          'View Website',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      adjustWidth(10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                )
              ]
            : [
                kHeight10,
                Icon(Icons.web_sharp,
                    color: Theme.of(context).colorScheme.onPrimary),
                kHeight10,
                Text(
                  'Website details not available',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                kHeight10
              ],
      ),
    );
  }
}
