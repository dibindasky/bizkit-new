import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/application/presentation/screens/connections/connection_request_sscreen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/connections/card_view/my_connection_detail_first_half.dart';
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
                          : RoundedRectangleBorder(
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
                          : RoundedRectangleBorder(
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
                  ? const ContactConnectionsTab()
                  : const ContactConnectionsTab(),
            )
          ],
        ),
      ),
    );
  }
}

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<ContactsBloc, ContactsState>(
        listener: (context, state) {
          if (state.message != null) {
            showSnackbar(
              context,
              message: state.message!,
            );
          }
        },
        builder: (context, state) {
          print('contacts list length ==> (${state.contactList?.length})');
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.contactList == null || state.hasError) {
            return const Center(
              child: Text('Contacts List is Empty'),
            );
          } else {
            return AlphabetScrollView(
              list: state.contactList!
                  .map((e) => AlphaModel(e.name ?? 'Names'))
                  .toList(),
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle: TextStyle(
                fontSize: kwidth * .042,
                color: smallBigGrey,
              ),
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
              itemBuilder: (context, index, __) {
                final data = state.contactList![index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(HomeFirstViewAllContactTileDetailView(
                      userId: data.id,
                    )),
                  ),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        data.photo != null && data.photo!.isNotEmpty
                            ? CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(data.photo!))
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
                        const Positioned(
                          right: 0,
                          child: Icon(
                            Icons.circle,
                            size: 10,
                            color: kgreen,
                          ),
                        ),
                      ],
                    ),
                    title: Row(
                      children: [
                        Text(
                          data.name ?? data.phoneNumber ?? 'data',
                          style: TextStyle(
                            fontSize: kwidth * .040,
                          ),
                        ),
                        //   adjustWidth(kwidth * .03),
                        //   Text(
                        //     // data.jobTitle ??
                        //     'Job Title',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w200,
                        //       fontSize: kwidth * .031,
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
