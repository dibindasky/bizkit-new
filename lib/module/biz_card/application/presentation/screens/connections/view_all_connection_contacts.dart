import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/tabs/bizkit_connection_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/tabs/contacts_connection_tab.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GlobalKey globalSearchConnection = GlobalKey();
final GlobalKey globalKeycontactList = GlobalKey();
final GlobalKey globalKeyBizkitConnections = GlobalKey();
final GlobalKey globalKeyConnectionRequest = GlobalKey();
final GlobalKey globalKeyVisitingCard = GlobalKey();

class MyConnectionsViewAllContacts extends StatefulWidget {
  const MyConnectionsViewAllContacts({super.key});

  @override
  State<MyConnectionsViewAllContacts> createState() =>
      _MyConnectionsViewAllContactsState();
}

class _MyConnectionsViewAllContactsState
    extends State<MyConnectionsViewAllContacts> {
  final ValueNotifier tabNotifier = ValueNotifier(0);
  bool isShowcaseSeen = false;
  final homeScreenShowCase = 'isShowcaseConnectionScreen';

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    final contactsController = Get.find<ContactsController>();
    final cardController = Get.find<CardController>();
    final levelSharingController = Get.find<LevelSharingController>();
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          // Swiped right
          if (tabNotifier.value == 1) {
            tabNotifier.value = 0;
            tabNotifier.notifyListeners();
          }
        }
        if (details.primaryVelocity! < 0) {
          // Swiped left
          if (tabNotifier.value == 0) {
            tabNotifier.value = 1;
            tabNotifier.notifyListeners();
          }
        }
      },
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kwhite,
              size: 18,
            ),
          ),
          backgroundColor: knill,
          title: Text(
            'My Connections',
            style: textHeadStyle1,
          ),
          actions: [
            InkWell(
              onTap: () {
                levelSharingController.fetchIndividualSharedFields(
                    queryParameter: IndividualSharedFieldsQueryParamsModel(
                        bizcardId: cardController.bizcardId.value));
                GoRouter.of(context)
                    .pushNamed(Routes.recievedConnectionRequests);
              },
              child: Obx(
                () =>
                    connectionsController.recievedConnectionRequestLoading.value
                        ? SizedBox(
                            height: 20,
                            width: 26,
                            child: Image.asset(iconConnectionPeople))
                        : SizedBox(
                            height: 20,
                            width: 26,
                            child: Stack(
                              children: [
                                Image.asset(iconConnectionPeople),
                                Positioned(
                                  right: 10,
                                  child: Obx(
                                    () => Text(
                                      '${connectionsController.recievedConnectionRequests.length}',
                                      style: const TextStyle(color: kblack),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
              ),
            ),
            kWidth10,
            kWidth10
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CupertinoTextField(
                controller: connectionsController.myConnectionsearchController,
                onChanged: (value) {
                  if (tabNotifier.value == 1) {
                    contactsController.searchContact(value);
                  } else {
                    connectionsController.searchConnections();
                  }
                },
                prefix: const Icon(
                  Icons.search,
                  color: kwhite,
                ),
                style: const TextStyle(
                  color: kwhite,
                ),
                placeholder: 'Search Connection',
                placeholderStyle: const TextStyle(
                  fontSize: 16,
                  color: klightgrey,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: textFieldFillColr,
                ),
                cursorColor: kwhite,
                suffix: Row(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: tabNotifier,
                        builder: (context, value, _) {
                          return InkWell(
                              onTap: () {
                                if (tabNotifier.value == 0) {
                                  tabNotifier.value = 1;
                                  connectionsController.myConnectionsearchController.clear();
                                  tabNotifier.notifyListeners();
                                } else {
                                  tabNotifier.value = 0;
                                  connectionsController.myConnectionsearchController.clear();
                                  tabNotifier.notifyListeners();
                                }
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(value == 0
                                  ? Icons.arrow_circle_right_outlined
                                  : Icons.arrow_circle_left_outlined));
                        }),
                  ],
                ),
              ),
              adjustHieght(kwidth * .05),
              ValueListenableBuilder(
                valueListenable: tabNotifier,
                builder: (context, value, child) => Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () {
                          tabNotifier.value = 0;
                          FocusScope.of(context).unfocus();
                        },
                        color: value != 0 ? klightDarkGrey : neonShade,
                        child: const Text('Bizkit Connections'),
                      ),
                    ),
                    kWidth10,
                    Expanded(
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () {
                          tabNotifier.value = 1;
                          FocusScope.of(context).unfocus();
                        },
                        color: value != 1 ? klightDarkGrey : neonShade,
                        child: const Text('All Contacts'),
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: tabNotifier,
                builder: (context, value, child) => value == 0
                    ? const BizkitConnectionsTab()
                    : const ContactConnectionsTab(),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              connectionsController.searchBizkitUsers();
              GoRouter.of(context).pushNamed(Routes.addConnection);
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
