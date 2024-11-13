import 'dart:convert';

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardAndConnectionScreen extends StatefulWidget {
  const BizCardAndConnectionScreen({super.key});

  @override
  State<BizCardAndConnectionScreen> createState() =>
      _BizCardAndConnectionScreenState();
}

class _BizCardAndConnectionScreenState extends State<BizCardAndConnectionScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: kgrey.withOpacity(0.1),
                    borderRadius: kBorderRadius15),
                child: const Row(
                  children: [Icon(Icons.search), Text('Search')],
                ),
              ),
              adjustHieght(20.h),
              TabBar(
                overlayColor: WidgetStateColor.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.grey,
                controller: tabController,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                tabs: [
                  Tab(
                    child: Text(
                      'Connections',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Contacts',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Requests',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Received',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Shared',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
              adjustHieght(20.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Scaffold(
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: 30,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                elevation: 0,
                                child: ListTile(
                                  onTap: () {
                                    // if ((connectionsController
                                    //             .myConnections[index].cards?.length ??
                                    //         0) >
                                    //     1) {
                                    //   showDialog(
                                    //     context: context,
                                    //     builder: (context) => Dialog(
                                    //       shape: BeveledRectangleBorder(
                                    //           borderRadius: kBorderRadius10),
                                    //       child: CardsbasedOnUserConnection(
                                    //           card: connectionsController
                                    //               .myConnections[index].cards),
                                    //     ),
                                    //   );
                                    // } else {
                                    //   final id = connectionsController
                                    //       .myConnections[index].cards
                                    //       ?.map((e) => e.toCard)
                                    //       .toList();
                                    //   Map<String, String> map = id != null
                                    //       ? {'myCard': 'false', 'cardId': id.first ?? ''}
                                    //       : <String, String>{};
                                    //   GoRouter.of(context).pushNamed(Routes.cardDetailView,
                                    //       pathParameters: map);
                                    // }
                                  },
                                  leading: const CircleAvatar(
                                    backgroundColor: textFieldFillColr,
                                    backgroundImage:
                                        AssetImage(chatSectionPersonDummyImg2),
                                  ),
                                  title: Text(
                                    // connectionsController
                                    //         .connectionsSearchList[index].username ??
                                    'Name',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    // Check if the cards list exists and is not empty
                                    // (connectionsController
                                    //                 .connectionsSearchList[index].cards !=
                                    //             null &&
                                    //         connectionsController
                                    //             .connectionsSearchList[index]
                                    //             .cards!
                                    //             .isNotEmpty)
                                    //     ? connectionsController.connectionsSearchList[index]
                                    //             .cards!.first.businessDesignation ??
                                    //         'Designation'
                                    //     : 'No Designation',

                                    "Designation",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  trailing: PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          onTap: () {
                                            // connectionsController.unfollowRequest(
                                            //     context: context,
                                            //     unfollowRequest: UnfollowConnectionModel(
                                            //         connectionId: connectionsController
                                            //             .connectionsSearchList[index]
                                            //             .cards!
                                            //             .first
                                            //             .connectionId));
                                          },
                                          child: Text(
                                            'Unfollow',
                                            style: textThinStyle1.copyWith(
                                                color: kred),
                                          ),
                                        )
                                      ];
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      floatingActionButton: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: FloatingActionButton(
                          shape: const CircleBorder(),
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    Scaffold(
                      body: ContactConnectionsTab(),
                    ),
                    Text(
                      'Tab3',
                      style: TextStyle(color: kblack),
                    ),
                    Text(
                      'Tab4',
                      style: TextStyle(color: kblack),
                    ),
                    Text(
                      'Tab5',
                      style: TextStyle(color: kblack),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contactController = Get.find<ContactsController>();
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
                  fontSize: kwidth * .049,
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
                            backgroundImage: data.profilePicture != null &&
                                    data.profilePicture!.isNotEmpty
                                ? MemoryImage(
                                    base64.decode(
                                      getBase64(data.profilePicture ?? ''),
                                    ),
                                  )
                                : null,
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
    ));
  }
}
