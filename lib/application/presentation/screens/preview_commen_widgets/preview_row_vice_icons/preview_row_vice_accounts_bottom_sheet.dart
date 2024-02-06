import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/copy_clipboard/copy_clipboard.dart';
import 'package:flutter/material.dart';

class ScreenPreviewRowiceAccountsBottomSheet extends StatelessWidget {
  const ScreenPreviewRowiceAccountsBottomSheet({super.key});

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
                Text('Company'),
                Text('Personal'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AccountsListviewBuilder(acountIsCompany: true),
                  AccountsListviewBuilder(acountIsCompany: false),
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
  AccountsListviewBuilder({
    super.key,
    required this.acountIsCompany,
  });

  final bool acountIsCompany;
  final List<String> accountIages = [
    'asset/images/watsapp account icon.png',
    'asset/images/facebok account icon.png',
    'asset/images/linked in account  icon.png',
    'asset/images/x account icon.png',
  ];
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
            Container(
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
            SizedBox(
              height: 450,
              child: ListView.builder(
                itemCount: 14,
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
                          backgroundImage: AssetImage(accountIages[index % 4]),
                        ),
                        adjustWidth(kwidth * .04),
                        const Text('Whatsapp'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            copyToClipboard(text: 'text', context: context);
                          },
                          child: Text(
                            'Link',
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
