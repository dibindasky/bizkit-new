import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/commen/snackbar/snackbar.dart';
import 'package:bizkit/application/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/home/view/widgets/connection_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllConnections extends StatelessWidget {
  const ViewAllConnections({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ContactsBloc>().add(const ContactsEvent.getContactsList());
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
                    icon: const Icon(Icons.mic),
                    color: kwhite,
                    onPressed: () {},
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: IconButton(
                      icon: const Icon(Icons.compare_arrows_rounded),
                      color: kwhite,
                      onPressed: () {},
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: kwhite,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            adjustHieght(kwidth * .02),
            Container(
              height: 20,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                gradient: neonShadeGradient,
              ),
              child: const Row(
                children: [
                  Text("A"),
                ],
              ),
            ),
            adjustHieght(kwidth * .05),
            Expanded(
              child: BlocConsumer<ContactsBloc, ContactsState>(
                listener: (context, state) {
                  if (state.hasError || state.message != null) {
                    showSnackbar(context,
                        message: state.message!,
                        );
                  }
                },
                builder: (context, state) {
                  if (state.loading) {
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
                          .map((e) => AlphaModel(e.displayName ?? 'Name'))
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
                            fadePageRoute(ListTileDetailView(
                                name: data.displayName ?? 'Name')),
                          ),
                          child: ListTile(
                            leading: Stack(
                              children: [
                                data.avatar != null && data.avatar!.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 18,
                                        backgroundImage:
                                            MemoryImage(data.avatar!))
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
                                  data.displayName ?? 'Name',
                                  style: TextStyle(
                                    fontSize: kwidth * .040,
                                  ),
                                ),
                                adjustWidth(kwidth * .03),
                                Text(
                                  data.jobTitle ?? 'Job Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: kwidth * .031,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
