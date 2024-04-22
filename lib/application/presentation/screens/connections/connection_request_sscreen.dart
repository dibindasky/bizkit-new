import 'dart:convert';

import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenConnectionRequests extends StatelessWidget {
  const ScreenConnectionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ConnectionRequestBloc>()
          .add(const ConnectionRequestEvent.getRequestLists());
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Connection Requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: neonShade));
            } else if (state.requestList != null &&
                state.requestList!.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<ConnectionRequestBloc>()
                      .add(const ConnectionRequestEvent.getRequestLists());
                  await Future.delayed(const Duration(seconds: 2));
                },
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: state.requestList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data = state.requestList![index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: kneonShade),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(children: [
                        // image profile
                        CircleAvatar(
                          radius: kwidth * 0.08,
                          backgroundImage: data.image != null
                              ? MemoryImage(base64.decode(
                                  data.image!.startsWith('data')
                                      ? data.image!.substring(22)
                                      : data.image!))
                              : null,
                          backgroundColor: smallBigGrey,
                          child: data.image != null
                              ? null
                              : const Icon(Icons.person, color: neonShade),
                        ),
                        adjustHieght(10),
                        Text(
                          data.company == null || data.company == ''
                              ? data.name ?? ''
                              : data.company ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                        ),
                        Text(
                          data.designation ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         data.company ?? '',
                        //         overflow: TextOverflow.ellipsis,
                        //         style: textStyle1,
                        //       ),
                        //     ),
                        //     const Text(' | '),
                        //     Expanded(
                        //       child: Text(
                        //         data.designation ?? '',
                        //         overflow: TextOverflow.ellipsis,
                        //         style: textStyle1,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        adjustHieght(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // cancel request
                            InkWell(
                              onTap: () {
                                context.read<ConnectionRequestBloc>().add(
                                    ConnectionRequestEvent.deleteRequest(
                                        id: data.id!));
                              },
                              child: CircleAvatar(
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: CircleAvatar(
                                      backgroundColor: kDefaultIconDarkColor,
                                      child: const Icon(
                                        Icons.close,
                                        color: kwhite,
                                      )),
                                ),
                              ),
                            ),
                            // accept request
                            InkWell(
                                onTap: () {
                                  context.read<ConnectionRequestBloc>().add(
                                        ConnectionRequestEvent.addConnection(
                                          createConnectionWithCardIdModel:
                                              CreateConnectionWithCardIdModel(
                                            connectionRequestId: data.id,
                                          ),
                                        ),
                                      );
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => Dialog(
                                  //       child: Container(
                                  //     padding: const EdgeInsets.all(20),
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: const BorderRadius.all(
                                  //             Radius.circular(20)),
                                  //         border:
                                  //             Border.all(color: kneonShade)),
                                  //     child: Column(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       children: [
                                  //         const Text(
                                  //             'Do you wish to share your bizcard with your new connection?'),
                                  //         adjustHieght(20),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceAround,
                                  //           children: [
                                  //             FilledButton(
                                  //                 style: ButtonStyle(
                                  //                     side: const MaterialStatePropertyAll(
                                  //                         BorderSide(
                                  //                             color:
                                  //                                 kneonShade)),
                                  //                     backgroundColor:
                                  //                         MaterialStatePropertyAll(
                                  //                             kDefaultIconDarkColor)),
                                  //                 onPressed: () {
                                  //                   Navigator.pop(context);
                                  //                 },
                                  //                 child: const Text('Cancel',
                                  //                     style: TextStyle(
                                  //                         color: kwhite))),
                                  //             FilledButton(
                                  //               style: const ButtonStyle(
                                  //                   side:
                                  //                       MaterialStatePropertyAll(
                                  //                           BorderSide(
                                  //                               color: kblack)),
                                  //                   backgroundColor:
                                  //                       MaterialStatePropertyAll(
                                  //                           neonShade)),
                                  //               onPressed: () {
                                  //                 context
                                  //                     .read<
                                  //                         ConnectionRequestBloc>()
                                  //                     .add(
                                  //                       ConnectionRequestEvent
                                  //                           .addConnectionRequests(
                                  //                         addConnectionRequestModel:
                                  //                             AddConnectionRequestModel(
                                  //                                 cardUserId: data
                                  //                                     .cardUserId),
                                  //                       ),
                                  //                     );
                                  //                 Navigator.pop(context);
                                  //               },
                                  //               child: const Text(
                                  //                 'Share Card',
                                  //                 style:
                                  //                     TextStyle(color: kwhite),
                                  //               ),
                                  //             )
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )),
                                  // );
                                },
                                child: const CircleAvatar(
                                    child: Icon(Icons.check, color: kwhite))),
                          ],
                        )
                      ]),
                    );
                  },
                ),
              );
            } else {
              return RefreshIndicatorCustom(
                  image: emptyNodata3,
                  message: 'You have no new requests',
                  onRefresh: () {
                    context
                        .read<ConnectionRequestBloc>()
                        .add(const ConnectionRequestEvent.getRequestLists());
                  });
            }
          },
        ),
      ),
    );
  }
}
