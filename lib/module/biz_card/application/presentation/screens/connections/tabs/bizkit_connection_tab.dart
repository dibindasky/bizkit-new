import 'dart:convert';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
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
            } else if (connectionsController.connectionsSearchList.isEmpty) {
              return ErrorRefreshIndicator(
                onRefresh: () {},
                errorMessage: 'No bizcard connections',
                image: emptyNodata2,
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => kHeight5,
                shrinkWrap: true,
                itemCount: connectionsController.connectionsSearchList.length,
                itemBuilder: (context, index) {
                  //final data = state.bizkitConnections![index];
                  return Card(
                    color: lightColr,
                    child: ListTile(
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
                        // Check if the cards list exists and is not empty
                        (connectionsController
                                        .connectionsSearchList[index].cards !=
                                    null &&
                                connectionsController
                                    .connectionsSearchList[index]
                                    .cards!
                                    .isNotEmpty)
                            ? connectionsController.connectionsSearchList[index]
                                    .cards!.first.businessDesignation ??
                                'Designation'
                            : 'No Designation',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                connectionsController.unfollowRequest(
                                    context: context,
                                    unfollowRequest: UnfollowConnectionModel(
                                        connectionId: connectionsController
                                            .connectionsSearchList[index]
                                            .cards!
                                            .first
                                            .connectionId));
                              },
                              child: Text(
                                'Unfollow',
                                style: textThinStyle1.copyWith(color: kred),
                              ),
                            )
                          ];
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
