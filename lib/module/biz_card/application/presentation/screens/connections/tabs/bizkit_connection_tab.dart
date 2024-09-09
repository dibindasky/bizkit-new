import 'dart:convert';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizkitConnectionsTab extends StatelessWidget {
  const BizkitConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          // context.read<ConnectionRequestBloc>().add(
          //     const ConnectionRequestEvent.getBizkitConnections(
          //         query: ''));
          connectionsController.searchConnections(
              searchQuery: SearchQuery(search: ''));
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Obx(
          () {
            if (connectionsController.searchConnectionsLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                  child: ColoredBox(color: kgrey),
                ),
                shrinkWrap: true,
                itemCount: connectionsController.connectionsSearchList.length,
                itemBuilder: (context, index) {
                  //final data = state.bizkitConnections![index];
                  return ListTile(
                      onTap: () {
                        //print(data.toJson());
                        // Navigator.push(
                        //     context, cardFadePageRoute(const ScreenCardDetailView()));
                      },
                      leading: CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        backgroundImage: MemoryImage(
                            base64.decode(getBase64(imageTestingBase64))),
                      ),
                      title: Text(
                        connectionsController
                                .connectionsSearchList[index].username ??
                            'Name',
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        connectionsController.connectionsSearchList[index]
                                .businessDesignation ??
                            'Designation',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: PopupMenuButton(itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              onTap: () {
                                // context.read<ConnectionRequestBloc>().add(
                                //     ConnectionRequestEvent
                                //         .blockBizkitConnections(
                                //             blockBizkitConnection:
                                //                 BlockBizkitConnection(
                                //                     isBlock: true),
                                //             connectionId: data.id!));
                              },
                              child: const Text('Block'))
                        ];
                      }));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
