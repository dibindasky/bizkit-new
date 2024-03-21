import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/application/presentation/screens/connections/connection_request_sscreen.dart';
import 'package:bizkit/application/presentation/screens/connections/tabs/bizkit_connection_tab.dart';
import 'package:bizkit/application/presentation/screens/connections/tabs/contacts_connection_tab.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionsViewAllContacts extends StatelessWidget {
  MyConnectionsViewAllContacts({super.key});

  final ValueNotifier tabNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.read<ContactsBloc>().add(const ContactsEvent.getConnections());
    });
    return Scaffold(
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
          IconButton(
              onPressed: () => Navigator.push(
                  context, fadePageRoute(const ScreenAddConnections())),
              icon: const Icon(Icons.add_circle, color: kneonShade)),
          adjustWidth(10),
          InkWell(
            onTap: () => Navigator.push(
                context, fadePageRoute(const ScreenConnectionRequests())),
            child: SizedBox(
              height: 20,
              width: 26,
              child: Stack(
                children: [
                  Image.asset(iconConnectionPeople),
                  const Positioned(
                      right: 10,
                      child: Text(
                        '4',
                        style: TextStyle(color: kblack),
                      ))
                ],
              ),
            ),
          ),
          adjustWidth(20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CupertinoTextField(
              onChanged: (value) {
                print('search bar =====================');
                if (tabNotifier.value == 1) {
                  print('search bar ');
                  context
                      .read<ContactsBloc>()
                      .add(ContactsEvent.searchContact(query: value));
                } else {
                  // search for bizkit connection
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
                  IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: kwhite,
                    onPressed: () {},
                  ),
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
                      shape: value != 0
                          ? null
                          : const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        tabNotifier.value = 0;
                        tabNotifier.notifyListeners();
                      },
                      color: value != 0 ? kgrey : neonShade,
                      child: const Text('Bizkit Connections'),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      shape: value != 1
                          ? null
                          : const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        tabNotifier.value = 1;
                        tabNotifier.notifyListeners();
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
    );
  }
}
