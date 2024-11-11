import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/first_half_sction/widgets/cards_based_on_user.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
          connectionsController.searchConnections(
              );
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
                onRefresh: () async {
                  connectionsController.searchConnections(
                      );
                  await Future.delayed(const Duration(seconds: 2));
                },
                errorMessage: 'No bizcard connections',
                image: emptyNodata2,
              );
            } else {
              return ListView.separated(
                controller: connectionsController.myConnectionScrollController,
                separatorBuilder: (context, index) => kHeight5,
                shrinkWrap: true,
                itemCount: connectionsController.connectionsSearchList.length+(connectionsController.myConnectionLoadMore.value?1:0),
                itemBuilder: (context, index) {
                  if(index==connectionsController.connectionsSearchList.length&&connectionsController.myConnectionLoadMore.value){
                    return const Center(child: CircularProgressIndicator());
                  }
                  //final data = state.bizkitConnections![index];
                  return Card(
                  
                    color: lightColr,
                    child: ListTile(
                      
                      onTap: () {
                        if ((connectionsController
                                    .myConnections[index].cards?.length ??
                                0) >
                            1) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: BeveledRectangleBorder(
                                  borderRadius: kBorderRadius10),
                              child: CardsbasedOnUserConnection(
                                  card: connectionsController
                                      .myConnections[index].cards),
                            ),
                          );
                        } else {
                          final id = connectionsController
                              .myConnections[index].cards
                              ?.map((e) => e.toCard)
                              .toList();
                          Map<String, String> map = id != null
                              ? {'myCard': 'false', 'cardId': id.first ?? ''}
                              : <String, String>{};
                          GoRouter.of(context).pushNamed(Routes.cardDetailView,
                              pathParameters: map);
                        }
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
