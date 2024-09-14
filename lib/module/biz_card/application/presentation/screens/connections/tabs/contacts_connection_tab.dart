import 'dart:convert';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/module/biz_card/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //context.read<ContactsBloc>().add(const ContactsEvent.getConnections());
    });
    return Expanded(
      child: BlocConsumer<ContactsBloc, ContactsState>(
        listener: (context, state) {},
        builder: (context, state) {
          print('contacts list length ==> (${state.contactList?.length})');

          if (state.firstLoading) {
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
          if (state.fetchingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.contactList != null &&
              state.contactList!.isNotEmpty) {
            return Scrollbar(
              child: AlphabetScrollView(
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
                    onTap: () {
                      if (data.id != null && data.id != 0) {}
                    },
                    child: ListTile(
                      leading: data.photo != null && data.photo!.isNotEmpty
                          ? CircleAvatar(
                              radius: 18,
                              backgroundImage: MemoryImage(
                                  base64.decode(getBase64(data.photo!))))
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
                      trailing: data.id == null || data.id == 0
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
              ),
            );
          } else {
            return ErrorRefreshIndicator(
              onRefresh: () {
                // context
                //     .read<ContactsBloc>()
                //     .add(const ContactsEvent.getConnections());
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
