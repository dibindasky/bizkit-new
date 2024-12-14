import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/multiple_cards_list_dialog.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MyConnectionSection extends StatelessWidget {
  const MyConnectionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    final navbarController = Get.find<NavbarController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectionsController.fetchMyConnections(false);
    });
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Connections',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      navbarController.changeBottomBar(2);
                    },
                    child: Text(
                      'View All',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.w300, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
            adjustHieght(15.h),
            SizedBox(
              height: 90.h,
              child: Obx(
                () {
                  if (connectionsController.myConnectionsLoading.value) {
                    return ShimmerLoaderCircle(
                      radius: 35,
                      seprator: adjustWidth(kwidth * .02),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                    );
                  } else if (connectionsController.myConnections.isEmpty) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: GestureDetector(
                              onTap: () {
                                connectionsController.searchBizkitUsers();
                                GoRouter.of(context)
                                    .pushNamed(Routes.addConnection);
                              },
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 33,
                                    // backgroundColor: kGreyDark,
                                    backgroundImage: AssetImage(bizcardBgImage),
                                    child: Icon(
                                      Icons.add,
                                      color: kwhite,
                                      size: 20,
                                    ),
                                  ),
                                  adjustHieght(3.h),
                                  Expanded(
                                      child: Text('Add',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall)),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'No connections',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          kWidth20,
                        ],
                      ),
                    );
                  } else {
                    final length =
                        connectionsController.myConnections.length + 1;
                    return ListView.separated(
                      controller: connectionsController
                          .fetchMyConnectionScrollController,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .02),
                      itemCount: length +
                          (connectionsController.fetchMyconnectionLoadMore.value
                              ? 1
                              : 0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == length &&
                            connectionsController
                                .fetchMyconnectionLoadMore.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        // Get connection data directly from index
                        MyConnection connection = MyConnection();

                        if (index != 0) {
                          connection =
                              connectionsController.myConnections[index - 1];
                        }
                        // add connection button
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () {
                                connectionsController.searchBizkitUsers();
                                GoRouter.of(context)
                                    .pushNamed(Routes.addConnection);
                              },
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 33,
                                    // backgroundColor: kGreyDark,
                                    backgroundImage: AssetImage(bizcardBgImage),
                                    child: Icon(
                                      Icons.add,
                                      color: kwhite,
                                      size: 20,
                                    ),
                                  ),
                                  adjustHieght(3.h),
                                  Expanded(
                                      child: Text('Add',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall)),
                                ],
                              ),
                            ),
                          );
                        }
                        final card = connection.cards?.isNotEmpty == true
                            ? connection.cards!.first
                            : null;
                        // final cIndex = index - 1;
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if ((connection.cards?.length ?? 0) > 1) {
                                  // Show dialog for multiple cards
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: kBorderRadius10),
                                      child: CardsbasedOnUserConnection(
                                        card: connection.cards,
                                      ),
                                    ),
                                  );
                                } else {
                                  GoRouter.of(context).pushNamed(
                                      Routes.cardDetailView,
                                      pathParameters: {
                                        'cardId':
                                            connection.cards?.first.toCard ??
                                                '',
                                        'myCard': 'false',
                                        'fromPreview': 'false'
                                      });
                                  connectionsController.getConnectionCardDetail(
                                      cardId:
                                          connection.cards?.first.toCard ?? '');
                                }
                              },
                              child: card?.imageUrl != null
                                  ? CircleAvatar(
                                      radius: 33,
                                      backgroundColor:
                                          kGreyNormal.withOpacity(0.3),
                                      child: NetworkImageWithLoader(
                                        card?.imageUrl ?? '',
                                        radius: 50,
                                        errorWidget: const Icon(Icons.person),
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: kblack,
                                      child: Icon(
                                        Icons.person,
                                        color: kwhite,
                                      ),
                                    ),
                            ),
                            adjustHieght(5.h),
                            Text(
                              connection.username ?? '',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
