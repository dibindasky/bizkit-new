import 'dart:developer';

import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/share_card_contact/share_card_contact.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ShareCardThroughContactBottomSheet extends StatelessWidget {
  const ShareCardThroughContactBottomSheet({super.key, required this.cardId});

  final String cardId;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ContactsController());
    log('BIZCARD ID ===> $cardId');
    return Container(
      height: 500,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: controller.fetchingLoading.value
                        ? ShimmerLoader(
                            itemCount: 40,
                            height: 50.h,
                            width: double.infinity,
                            seprator: kHeight5)
                        : controller.contactList.isEmpty
                            ? Center(
                                child: Text(
                                'No Contacts Found',
                                style: Theme.of(context).textTheme.displaySmall,
                              ))
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
                                      title: Text(
                                        data.name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      leading: const CircleAvatar(
                                        backgroundColor: kblack,
                                        child: Icon(Iconsax.profile_2user,
                                            color: kGreyNormal),
                                      ),
                                      trailing: Wrap(
                                        children: [
                                          selected
                                              ? const Icon(Icons.check_box,
                                                  color: kneonShade)
                                              : const Icon(Icons
                                                  .check_box_outline_blank),
                                        ],
                                      ));
                                },
                              ),
                  ),
                ),
                Obx(() {
                  return controller.cardSharingLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              controller.shareCardToContacts(context,
                                  cardId: cardId);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kneonShade),
                              child: Center(
                                  child: Text(
                                'Share card',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 14),
                              )),
                            ),
                          ),
                        );
                }),
                kHeight5,
              ],
            );
          }),
    );
  }
}
