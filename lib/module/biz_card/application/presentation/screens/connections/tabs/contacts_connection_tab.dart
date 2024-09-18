import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contactController = Get.find<ContactsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      contactController.getConnections();
    });
    return Expanded(child: Scrollbar(
      child: Obx(
        () {
          if (contactController.firstLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                adjustHieght(20),
                const Text(
                  'We are syncing your contacts,\n please come back in few minutes',
                  textAlign: TextAlign.center,
                )
              ],
            );
          }
          if (contactController.fetchingLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (contactController.contactList != null &&
              contactController.contactList.isNotEmpty) {
            return AlphabetScrollView(
              list: contactController.contactList
                  .map((e) => AlphaModel(e.name ?? ""))
                  .toList(),
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle:
                  TextStyle(fontSize: kwidth * .042, color: smallBigGrey),
              selectedTextStyle:
                  TextStyle(fontSize: kwidth * .049, color: kwhite),
              overlayWidget: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.star_border_sharp,
                    size: 50,
                    color: neonShade,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      value.toUpperCase(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              itemBuilder: (context, index, _) {
                final data = contactController.contactList[index];
                return GestureDetector(
                  onTap: () {
                    // log('phone ${data.phoneNumber}');
                    if (data.userId != null && data.userId!.isNotEmpty) {
                      Navigator.of(context).push(
                        cardFadePageRoute(ScreenCardDetailView(
                          cardId: data.userId,
                          myCard: false,
                        )),
                      );
                    }
                  },
                  child: ListTile(
                    leading: data.profilePicture != null &&
                            data.profilePicture!.isNotEmpty
                        ? CircleAvatar(
                            radius: 18,
                            backgroundImage: MemoryImage(
                                base64.decode(getBase64(data.profilePicture!))))
                        : const CircleAvatar(
                            radius: 18,
                            backgroundColor: textFieldFillColr,
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: neonShade,
                              ),
                            ),
                          ),
                    title: Row(
                      children: [
                        Text(
                          data.name ?? data.phoneNumber ?? '',
                          style: TextStyle(
                            fontSize: kwidth * .040,
                          ),
                        ),
                      ],
                    ),
                    trailing: data.userId == null || data.userId!.isNotEmpty
                        ? Wrap(
                            children: [
                              InkWell(
                                  onTap: () {
                                    LaunchUrl.openSMS(
                                        phoneNumber: data.phoneNumber ?? '',
                                        message: 'Join bizkit');
                                  },
                                  child: Text('Invite',
                                      style: textStyle1.copyWith(
                                          color: neonShade))),
                              adjustWidth(20)
                            ],
                          )
                        : null,
                  ),
                );
              },
            );
          } else {
            return ErrorRefreshIndicator(
              onRefresh: () {},
              errorMessage: 'No Contacts',
              image: emptyNodata2,
            );
          }
        },
      ),
    ));
  }
}
