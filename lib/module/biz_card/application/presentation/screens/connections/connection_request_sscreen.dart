import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class ScreenConnectionRequests extends StatelessWidget {
  const ScreenConnectionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context
      //     .read<ConnectionRequestBloc>()
      //     .add(const ConnectionRequestEvent.getRequestLists());
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
        child: RefreshIndicator(
          onRefresh: () async {
            // context
            //     .read<ConnectionRequestBloc>()
            //     .add(const ConnectionRequestEvent.getRequestLists());
            await Future.delayed(const Duration(seconds: 2));
          },
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 3,
            itemBuilder: (context, index) {
              // final data = state.requestList![index];
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
                    backgroundImage: MemoryImage(base64.decode(
                        imageTestingBase64.startsWith('data')
                            ? imageTestingBase64.substring(22)
                            : imageTestingBase64)),
                    backgroundColor: smallBigGrey,
                  ),
                  adjustHieght(10),
                  Text(
                    'Name',
                    overflow: TextOverflow.ellipsis,
                    style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                  ),
                  Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                    style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                  ),
                  adjustHieght(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // cancel request
                      InkWell(
                        onTap: () {
                          // context.read<ConnectionRequestBloc>().add(
                          //     ConnectionRequestEvent.deleteRequest(
                          //         id: data.id!));
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: const Text('Reject  Connection'),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  OutlinedButton(
                                      onPressed: () {
                                        //context
                                        // .read<
                                        //     ConnectionRequestBloc>()
                                        // .add(ConnectionRequestEvent
                                        //     .addConnectionRequests(
                                        //         addConnectionRequestModel:
                                        //             AddConnectionRequestModel(
                                        //                 cardUserId:
                                        //                     data.userId),
                                        //         index: index));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Reject'))
                                ]),
                          );
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
                            // context.read<ConnectionRequestBloc>().add(
                            //       ConnectionRequestEvent.addConnection(
                            //         createConnectionWithCardIdModel:
                            //             CreateConnectionWithCardIdModel(
                            //           connectionRequestId: data.id,
                            //         ),
                            //       ),
                            //     );
                            // if (data.hasConnection == false) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Request back to Add Connection'),
                                  actions: [
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel')),
                                    OutlinedButton(
                                        onPressed: () {
                                          //context
                                          // .read<
                                          //     ConnectionRequestBloc>()
                                          // .add(ConnectionRequestEvent
                                          //     .addConnectionRequests(
                                          //         addConnectionRequestModel:
                                          //             AddConnectionRequestModel(
                                          //                 cardUserId:
                                          //                     data.userId),
                                          //         index: index));
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Request'))
                                  ]),
                            );
                          },
                          child: const CircleAvatar(
                              child: Icon(Icons.check, color: kwhite))),
                    ],
                  )
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
