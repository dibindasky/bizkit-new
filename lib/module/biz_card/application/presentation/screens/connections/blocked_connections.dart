import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';

class CardBlockedConnections extends StatefulWidget {
  const CardBlockedConnections({super.key});

  @override
  State<CardBlockedConnections> createState() => _CardBlockedConnectionsState();
}

class _CardBlockedConnectionsState extends State<CardBlockedConnections> {
  late ScrollController scrollController = ScrollController();

  Future<void> onRefresh() async {
    // context
    //     .read<ConnectionRequestBloc>()
    //     .add(const ConnectionRequestEvent.getBlockeConnections(isLoad: true));
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // context
        //     .read<ConnectionRequestBloc>()
        //     .add(const ConnectionRequestEvent.getBlockeConnectionsEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context
    //     .read<ConnectionRequestBloc>()
    //     .add(const ConnectionRequestEvent.getBlockeConnections(isLoad: false)));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Blocked Connections',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: 4,
            //  (state.blockedConnections?.length ?? 0) +
            //     (state.blockedConnectionsLoading ? 1 : 0),
            itemBuilder: (context, index) {
              // if (state.blockedConnectionsLoading &&
              //     index == state.blockedConnections!.length) {
              //   return const LoadingAnimation();
              // }
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      // final Map<String, String> map =
                      //     state.blockedConnections != null &&
                      //             state.blockedConnections![index].cardId !=
                      //                 null
                      //         ? {
                      //             'myCard': 'false',
                      //             'cardId': state
                      //                 .blockedConnections![index].cardId!
                      //                 .toString()
                      //           }
                      //         : <String, String>{};
                      // GoRouter.of(context).pushNamed(
                      //   Routes.cardDetailView,
                      //   pathParameters: map,
                      // );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        child: Row(
                          children: [
                            adjustWidth(kwidth * .04),
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: smallBigGrey,
                              backgroundImage: MemoryImage(base64
                                  .decode(imageTestingBase64.substring(22))),
                            ),
                            adjustWidth(kwidth * .04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: textStyle1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Designation',
                                    style: textStyle1.copyWith(
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCustomConfirmationDialogue(
                                  context: context,
                                  title: 'Do you want to unblock this person',
                                  onTap: () {
                                    // context.read<ConnectionRequestBloc>().add(
                                    //       ConnectionRequestEvent
                                    //           .blockBizkitConnections(
                                    //               blockBizkitConnection:
                                    //                   BlockBizkitConnection(
                                    //                       isBlock: false),
                                    //               connectionId: state
                                    //                   .blockedConnections![
                                    //                       index]
                                    //                   .id!),
                                    //     );
                                  },
                                  buttonText: 'Unblock',
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: neonShade,
                                    width: 1,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: Text('Unblock'),
                                ),
                              ),
                            ),
                            adjustWidth(kwidth * .04),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: .3),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
