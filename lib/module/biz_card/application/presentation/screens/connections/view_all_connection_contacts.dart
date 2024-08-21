import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/connection_request_sscreen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/tabs/bizkit_connection_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/tabs/contacts_connection_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/blocked_connections.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

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
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) async {
      final showCase =
          await SecureStorage.getHomeShowCaseViwed(homeScreenShowCase);
      setState(() {
        isShowcaseSeen = showCase;
      });
      if (!isShowcaseSeen) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ShowCaseWidget.of(context).startShowCase([
            globalSearchConnection,
            globalKeycontactList,
            globalKeyBizkitConnections,
            globalKeyConnectionRequest,
            globalKeyVisitingCard,
          ]);
        });
        await SecureStorage.setHomeShowCaseViwed(homeScreenShowCase);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context
      //     .read<ConnectionRequestBloc>()
      //     .add(const ConnectionRequestEvent.getRequestLists());
    });
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
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
              onTap: () => Navigator.push(
                  context, cardFadePageRoute(const ScreenConnectionRequests())),
              child: SizedBox(
                height: 20,
                width: 26,
                child: Stack(
                  children: [
                    Image.asset(iconConnectionPeople),
                    BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
                      builder: (context, state) {
                        return Positioned(
                            right: 10,
                            child: Text(
                              state.requestList != null &&
                                      state.requestList!.isNotEmpty
                                  ? state.requestList!.length.toString()
                                  : '0',
                              style: const TextStyle(color: kblack),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
            kWidth10,
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      cardFadePageRoute(const CardBlockedConnections()));
                },
                icon: const Icon(Icons.block, color: kred)),
            const SizedBox(width: 3)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CupertinoTextField(
                controller: searchController,
                onChanged: (value) {
                  print('search bar =====================');
                  if (tabNotifier.value == 1) {
                    // context
                    //     .read<ContactsBloc>()
                    //     .add(ContactsEvent.searchContact(query: value));
                  } else {
                    // search for bizkit connection
                    // context.read<ConnectionRequestBloc>().add(
                    //     ConnectionRequestEvent.getBizkitConnections(
                    //         query: value));
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
                                  searchController.clear();
                                  tabNotifier.notifyListeners();
                                } else {
                                  tabNotifier.value = 0;
                                  searchController.clear();
                                  tabNotifier.notifyListeners();
                                }
                                // FocusScope.of(context).unfocus();
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
                          searchController.clear();
                          tabNotifier.notifyListeners();
                          // context.read<ConnectionRequestBloc>().add(
                          //     const ConnectionRequestEvent.getBizkitConnections(
                          //         query: ''));
                          // context
                          //     .read<ContactsBloc>()
                          //     .add(const ContactsEvent.searchContact(query: ''));
                          FocusScope.of(context).unfocus();
                        },
                        color: value != 0 ? kgrey : neonShade,
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
                          searchController.clear();
                          tabNotifier.notifyListeners();
                          // context.read<ConnectionRequestBloc>().add(
                          //     const ConnectionRequestEvent.getBizkitConnections(
                          //         query: ''));
                          // context
                          //     .read<ContactsBloc>()
                          //     .add(const ContactsEvent.searchContact(query: ''));
                          FocusScope.of(context).unfocus();
                        },
                        color: value != 1 ? kgrey : neonShade,
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
            // label: Text('Add Connection',style: textStyle1),
            // icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
                context, cardFadePageRoute(const ScreenCardAddConnections())),
            child: const Icon(Icons.add)),
      ),
    );
  }
}
