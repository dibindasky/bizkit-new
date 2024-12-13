import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/multiple_cards_list_dialog.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ConnectionsTab extends StatelessWidget {
  const ConnectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();

    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => connectionsController.searchConnections());
    return Scaffold(
      body: Obx(
        () {
          if (connectionsController.searchConnectionsLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (connectionsController.connectionsSearchList.isEmpty) {
            return ErrorRefreshIndicator(
              onRefresh: () async {
                connectionsController.searchConnections(refresh: true);
                await Future.delayed(const Duration(seconds: 2));
              },
              errorMessage: 'No bizcard connections',
              image: emptyNodata2,
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                connectionsController.searchConnections(refresh: true);
                await Future.delayed(const Duration(seconds: 2));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: connectionsController.myConnectionScrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          connectionsController.connectionsSearchList.length +
                              (connectionsController.myConnectionLoadMore.value
                                  ? 1
                                  : 0),
                      itemBuilder: (context, index) {
                        // Show loading indicator at the end of the list
                        if (index ==
                                connectionsController
                                    .connectionsSearchList.length &&
                            connectionsController.myConnectionLoadMore.value) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                                    ? {
                                        'myCard': 'false',
                                        'cardId': id.first ?? '',
                                        'fromPreview': 'false'
                                      }
                                    : <String, String>{};

                                Get.find<ConnectionsController>()
                                    .getConnectionCardDetail(
                                        cardId: id?.first ?? '', refresh: true);
                                GoRouter.of(context).pushNamed(
                                  Routes.cardDetailView,
                                  pathParameters: map,
                                );
                              }
                            },
                            leading: connectionsController
                                        .connectionsSearchList[index]
                                        .cards
                                        ?.isNotEmpty ==
                                    true
                                ? CircleAvatar(
                                    backgroundColor:
                                        kGreyNormal.withOpacity(0.3),
                                    child: NetworkImageWithLoader(
                                      connectionsController
                                              .connectionsSearchList[index]
                                              .cards!
                                              .first
                                              .imageUrl ??
                                          '',
                                      radius: 50,
                                      errorWidget: const Icon(Icons.person),
                                    ))
                                : const CircleAvatar(
                                    backgroundColor: kGreyDark,
                                    child: Icon(Icons.person),
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
                              // Check if the cards list exists and is not empty
                              (connectionsController
                                              .connectionsSearchList[index]
                                              .cards !=
                                          null &&
                                      connectionsController
                                          .connectionsSearchList[index]
                                          .cards!
                                          .isNotEmpty)
                                  ? connectionsController
                                          .connectionsSearchList[index]
                                          .cards!
                                          .first
                                          .businessDesignation ??
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
                                              .connectionsSearchList[index]
                                              .toUser,
                                          context: context,
                                          unfollowRequest:
                                              UnfollowConnectionModel(
                                                  connectionId:
                                                      connectionsController
                                                          .connectionsSearchList[
                                                              index]
                                                          .cards!
                                                          .first
                                                          .connectionId));
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
                    kHeight50,
                    kHeight50,
                    kHeight50,
                  ],
                ),
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
