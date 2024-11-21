import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contactController = Get.find<ContactsController>();
    return Scrollbar(
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
                Text(
                  'We are syncing your contacts,\n please come back in few minutes',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
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
                  .map(
                    (e) => AlphaModel(e.name ?? ""),
                  )
                  .toList(),
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle:
                  TextStyle(fontSize: kwidth * .040, color: smallBigGrey),
              selectedTextStyle: TextStyle(
                  fontSize: kwidth * .050,
                  color: Theme.of(context).colorScheme.onPrimary),
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
                      value,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
              itemBuilder: (context, index, _) {
                final data = contactController.contactList[index];
                return GestureDetector(
                  onTap: () {
                    if (data.userId == null || data.userId == '') {
                      LaunchUrl.openSMS(
                          phoneNumber: data.phoneNumber ?? '',
                          message: inviteToBizkitSMS);
                    } else {
                      Get.find<ConnectionsController>()
                          .checkConnecitonExistsAndCallCardDetail(context,
                              userID: data.userId!);
                    }
                  },
                  child: ListTile(
                    leading: data.profilePicture != null &&
                            data.profilePicture!.isNotEmpty
                        ? CircleAvatar(
                            backgroundColor: kblack,
                            radius: 18,
                            // backgroundImage: data.profilePicture != null &&
                            //         data.profilePicture!.isNotEmpty
                            //     ? MemoryImage(
                            //         base64.decode(
                            //           getBase64(data.profilePicture ?? ''),
                            //         ),
                            //       )
                            //     : null,
                            child: data.profilePicture != null &&
                                    data.profilePicture!.isNotEmpty
                                ? null
                                : const Icon(Icons.person),
                          )
                        : const CircleAvatar(
                            radius: 18,
                            backgroundColor: kblack,
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: neonShade,
                              ),
                            ),
                          ),
                    title: Text(
                      data.name ?? data.phoneNumber ?? '',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: kwidth * .030,
                                fontWeight: FontWeight.w300,
                              ),
                    ),
                    trailing: data.userId == null || data.userId!.isEmpty
                        ? Wrap(
                            children: [
                              InkWell(
                                  onTap: () {
                                    LaunchUrl.openSMS(
                                        phoneNumber: data.phoneNumber ?? '',
                                        message: inviteToBizkitSMS);
                                  },
                                  child: Text('Invite',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall)),
                              adjustWidth(20)
                            ],
                          )
                        : Wrap(
                            children: [
                              Obx(() => Get.find<ConnectionsController>()
                                              .loadingContact
                                              .value !=
                                          '' &&
                                      Get.find<ConnectionsController>()
                                              .loadingContact
                                              .value ==
                                          data.userId
                                  ? SizedBox(
                                      width: 50.h,
                                      child: const LinearProgressIndicator(),
                                    )
                                  : kempty)
                            ],
                          ),
                  ),
                );
              },
            );
          } else {
            return ErrorRefreshIndicator(
              onRefresh: () {
                contactController.getConnections();
              },
              errorMessage: 'No Contacts',
              image: emptyNodata2,
            );
          }
        },
      ),
    );
  }
}
