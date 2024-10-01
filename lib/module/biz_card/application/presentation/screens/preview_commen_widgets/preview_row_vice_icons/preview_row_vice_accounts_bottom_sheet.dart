import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/social_media_handle.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/copy_clipboard/copy_clipboard.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsListsBottomSheet extends StatelessWidget {
  const AccountsListsBottomSheet(
      {super.key, required this.personal, required this.business});

  final List<SocialMediaHandles> personal;
  final List<SocialMediaHandles> business;

  void handleCopyToClipboard(BuildContext context, String text) {
    copyToClipboard(text: text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kblack,
        ),
        child: Column(
          children: [
            const TabBar(
              dividerColor: knill,
              tabs: [
                Text('Personal'),
                Text('Company'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AccountsListviewBuilder(
                    socialMedia: personal,
                    acountIsCompany: true,
                    onCopyToClipboard: (text) =>
                        handleCopyToClipboard(context, text),
                  ),
                  AccountsListviewBuilder(
                    socialMedia: business,
                    acountIsCompany: false,
                    onCopyToClipboard: (text) =>
                        handleCopyToClipboard(context, text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountsListviewBuilder extends StatelessWidget {
  AccountsListviewBuilder(
      {super.key,
      required this.acountIsCompany,
      required this.onCopyToClipboard,
      required this.socialMedia});
  final Function(String) onCopyToClipboard;
  final bool acountIsCompany;
  final List<SocialMediaHandles> socialMedia;
  final Map<String, String> map = {
    'Instagram': imageInstagram,
    'LinkedIn': imageLinkedIn,
    'Whatsapp': imageWhatsap,
    'Telegram': imageTelegram,
    'Youtube': imageYoutube,
    'Facebook': imageFaceBook,
    'X': imageX
  };
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        adjustHieght(khieght * .03),
        const Divider(
          thickness: .3,
        ),
        Column(
          children: [
            SizedBox(
              height: 450,
              child: ListView.builder(
                itemCount: socialMedia.length + 1,
                itemBuilder: (context, index) {
                  if (index == socialMedia.length) {
                    return const SizedBox(height: 200);
                  }
                  return Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: backgroundColour,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        LaunchUrl.launchUrls(
                            url: socialMedia[index].link ?? "");
                      },
                      child: Row(
                        children: [
                          adjustWidth(kwidth * .03),
                          CircleAvatar(
                            backgroundColor: kwhite,
                            radius: 14,
                            backgroundImage:
                                AssetImage(map[socialMedia[index].label!]!),
                          ),
                          adjustWidth(kwidth * .04),
                          Text(socialMedia[index].label!),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              onCopyToClipboard(socialMedia[index].link ?? '');
                            },
                            child: Text(
                              'Copy Link',
                              style: textHeadStyle1.copyWith(
                                color: kblue,
                                fontSize: 12.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: kblue,
                              ),
                            ),
                          ),
                          adjustWidth(kwidth * .04),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
