import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/share_card_contact/share_card_contact.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShareCardThroughContactBottomSheet extends StatelessWidget {
  const ShareCardThroughContactBottomSheet({super.key, required this.cardId});

  final String cardId;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ContactsController());
    return Container(
      height: 500,
      width: double.infinity,
      color: kblack,
      child: GetBuilder<ContactsController>(
          id: 'share_contact',
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomTextFormField(
                    labelText: 'Search contacts',
                    onChanaged: (value) {
                      controller.searchContact(value);
                    },
                  ),
                ),
                Expanded(
                  child: controller.fetchingLoading.value
                      ? ShimmerLoader(
                          itemCount: 40,
                          height: 50.h,
                          width: double.infinity,
                          seprator: kHeight5)
                      : controller.contactList.isEmpty
                          ? const Center(child: Text('No Contacts Found'))
                          : ListView.builder(
                              itemCount: controller.contactList.length,
                              itemBuilder: (context, index) {
                                final data = controller.contactList[index];
                                final selected = (controller
                                            .shareCardContactModel
                                            .value
                                            .contacts ??
                                        <ShareCardContact>[])
                                    .any((element) =>
                                        element.email == data.email &&
                                        element.phoneNumber ==
                                            data.phoneNumber);
                                return ListTile(
                                    onTap: () =>
                                        controller.addOrRemoveContactToList(
                                            model: data, selected: selected),
                                    title: Text(data.name ?? ''),
                                    leading: CircleAvatar(
                                      backgroundColor: kgrey,
                                      backgroundImage:
                                          data.profilePicture != null &&
                                                  data.profilePicture != ''
                                              ? MemoryImage(base64Decode(
                                                  data.profilePicture ?? ''))
                                              : null,
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        selected
                                            ? const Icon(
                                                Icons.check_box_outlined,
                                                color: kneonShade)
                                            : const Icon(
                                                Icons.check_box_outline_blank),
                                      ],
                                    ));
                              },
                            ),
                ),
                Obx(() {
                  return controller.cardSharingLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : EventButton(
                          text: 'Share Card',
                          onTap: () {
                            controller.shareCardToContacts(context,
                                cardId: cardId);
                          });
                }),
                kHeight5,
              ],
            );
          }),
    );
  }
}
