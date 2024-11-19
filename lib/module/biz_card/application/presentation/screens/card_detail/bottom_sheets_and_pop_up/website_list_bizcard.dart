import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                // TextButton(
                //   onPressed: () async {
                //     await LaunchUrl.googleSearch(
                //       url: cardController.bizcardDetail.value
                //           .businessDetails!.websiteLink!,
                //     ).then(
                //       (value) => Navigator.pop(context),
                //     );
                //   },
                //   child: Text(
                //     cardController.bizcardDetail.value
                //         .businessDetails!.websiteLink!,
                //     style: const TextStyle(
                //       color: kblue,
                //       decorationColor: kblue,
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
                Text(
                  cardController
                      .bizcardDetail.value.businessDetails!.websiteLink!,
                ),
                kHeight10,
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: neonShade)),
                        onPressed: () async {
                          await LaunchUrl.googleSearch(
                            url: cardController.bizcardDetail.value
                                .businessDetails!.websiteLink!,
                          ).then(
                            (value) => Navigator.pop(context),
                          );
                        },
                        icon: const Icon(Icons.open_in_browser_outlined),
                        label: const Text(
                          'View Website',
                          style: TextStyle(color: neonShade),
                        ),
                      ),
                      adjustWidth(10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: neonShade)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: neonShade),
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
