import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/copy_clipboard/copy_clipboard.dart';
import 'package:flutter/material.dart';

class AccountsListsBottomSheet extends StatelessWidget {
  const AccountsListsBottomSheet(
      {super.key, required this.personal, required this.business});

  final List personal;
  final List business;

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
  final List socialMedia;
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
            GestureDetector(
              onTap: () => Navigator.of(context).push(fadePageRoute(
                   SocialMediahandlesScreen(fromBusiness: !acountIsCompany))),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                height: 70,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: ColoredBox(
                    color: lightColr,
                    child: Row(
                      children: [
                        adjustWidth(kwidth * .03),
                        const CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(
                            'asset/images/addButtunIconImage.png',
                          ),
                        ),
                        adjustWidth(kwidth * .03),
                        const Text('Add new')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                itemCount: socialMedia.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: backgroundColour,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        adjustWidth(kwidth * .03),
                        CircleAvatar(
                          backgroundColor: backgroundColour,
                          radius: 14,
                          backgroundImage:
                              AssetImage(map[socialMedia[index].label!]!),
                        ),
                        adjustWidth(kwidth * .04),
                        Text(socialMedia[index].label!),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            onCopyToClipboard(socialMedia[index].socialMedia!);
                            // copyToClipboard(text: 'text', context: context);
                          },
                          child: Text(
                            'copy link',
                            style: textHeadStyle1.copyWith(
                              color: neonShade,
                              decoration: TextDecoration.underline,
                              decorationColor: neonShade,
                            ),
                          ),
                        ),
                        adjustWidth(kwidth * .04),
                      ],
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
