import 'dart:convert';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart'
    as cards;
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ConnectionsTab extends StatelessWidget {
  const ConnectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    connectionsController.searchConnections();

    return Scaffold(
      body: Obx(
        () {
          if (connectionsController.searchConnectionsLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (connectionsController.connectionsSearchList.isEmpty) {
            return ErrorRefreshIndicator(
              onRefresh: () async {
                connectionsController.searchConnections();
                await Future.delayed(const Duration(seconds: 2));
              },
              errorMessage: 'No bizcard connections',
              image: emptyNodata2,
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                connectionsController.searchConnections();
                await Future.delayed(const Duration(seconds: 2));
              },
              child: ListView.builder(
                controller: connectionsController.myConnectionScrollController,
                itemCount: connectionsController.connectionsSearchList.length +
                    (connectionsController.myConnectionLoadMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  // Show loading indicator at the end of the list
                  if (index ==
                          connectionsController.connectionsSearchList.length &&
                      connectionsController.myConnectionLoadMore.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Render connection cards
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () {
                        final currentConnection =
                            connectionsController.myConnections[index];

                        if ((currentConnection.cards?.length ?? 0) > 1) {
                          // Show dialog for multiple cards
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: BeveledRectangleBorder(
                                  borderRadius: kBorderRadius10),
                              child: CardsbasedOnUserConnection(
                                card: currentConnection.cards,
                              ),
                            ),
                          );
                        } else {
                          // Navigate directly to card details
                          final id = currentConnection.cards
                              ?.map((e) => e.toCard)
                              .toList();
                          Map<String, String> map = id != null
                              ? {'myCard': 'false', 'cardId': id.first ?? ''}
                              : <String, String>{};
                          GoRouter.of(context).pushNamed(
                            Routes.cardDetailView,
                            pathParameters: map,
                          );
                        }
                      },
                      leading: const CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        backgroundImage:
                            AssetImage(chatSectionPersonDummyImg2),
                      ),
                      title: Text(
                        connectionsController
                                .connectionsSearchList[index].username ??
                            'Name',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      subtitle: Text(
                        (connectionsController.connectionsSearchList[index]
                                        .cards !=
                                    null &&
                                connectionsController.connectionsSearchList[index]
                                    .cards!
                                    .isNotEmpty)
                            ? connectionsController.connectionsSearchList[index]
                                    .cards!.first.businessDesignation ??
                                'Designation'
                            : 'No Designation',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                connectionsController.unfollowRequest(
                                  toUserId: connectionsController
                                      .connectionsSearchList[index].toUser,
                                  context: context,
                                  unfollowRequest: UnfollowConnectionModel(
                                    connectionId: connectionsController
                                        .connectionsSearchList[index]
                                        .cards!
                                        .first
                                        .connectionId,
                                  ),
                                );
                              },
                              child: Text(
                                'Unfollow',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: kred),
                              ),
                            )
                          ];
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            connectionsController.searchBizkitUsers();
            GoRouter.of(context).pushNamed(Routes.addConnection);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CardsbasedOnUserConnection extends StatelessWidget {
  const CardsbasedOnUserConnection({super.key, this.card});

  final List<cards.Card>? card;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Cards', style: textStyle1),
          ...List.generate(
            (card?.length ?? 0),
            (index) => Container(
              margin: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: neonShade),
                borderRadius: kBorderRadius10,
              ),
              child: ListTile(
                onTap: () {
                  final id = card
                      ?.map((e) => e.toCard ?? '')
                      .toList();
                  Map<String, String> map = id != null
                      ? {'myCard': 'false', 'cardId': id[index]}
                      : <String, String>{};
                  GoRouter.of(context)
                      .pushNamed(Routes.cardDetailView, pathParameters: map);
                  Navigator.pop(context);
                },
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: lightGrey,
                  child: ClipOval(
                    child: card?[index].imageUrl != null
                        ? Image.memory(
                            base64Decode(card?[index].imageUrl),
                            fit: BoxFit.cover,
                            width: 36,
                            height: 36,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image),
                          )
                        : const Icon(Icons.person, color: neonShade),
                  ),
                ),
                title: Text(
                  card?[index].name ?? '',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(card?[index].businessDesignation ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
