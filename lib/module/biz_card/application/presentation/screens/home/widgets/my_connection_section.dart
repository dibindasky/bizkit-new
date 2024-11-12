import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyConnectionSection extends StatelessWidget {
  const MyConnectionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectionsController.fetchMyConnections(true);
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
                  child: Text(
                    'View all',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: 13),
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
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () {
                                // Todo -> Navigate to add connection screen
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: ColoredBox(
                                      color: textFieldFillColr,
                                      child: SizedBox(
                                        height: 47.h,
                                        width: 50.w,
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 18.h,
                                            color: kwhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Add',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'No connections',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          kWidth10
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

                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () {},
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

                        // final cIndex = index - 1;
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                //  todo  After the details page is done - todo this

                                // if ((connectionsController
                                //             .myConnections[cIndex]
                                //             .cards
                                //             ?.length ??
                                //         0) >
                                //     1) {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) => Dialog(
                                //       shape:
                                //           BeveledRectangleBorder(
                                //               borderRadius:
                                //                   kBorderRadius10),
                                //       child: CardsbasedOnUserConnection(
                                //           card:
                                //               connectionsController
                                //                   .myConnections[
                                //                       cIndex]
                                //                   .cards),
                                //     ),
                                //   );
                                // } else {
                                //   final id = connectionsController
                                //       .myConnections[cIndex].cards
                                //       ?.map((e) => e.toCard)
                                //       .toList();
                                //   Map<String, String> map = id !=
                                //           null
                                //       ? {
                                //           'myCard': 'false',
                                //           'cardId': id.first ?? ''
                                //         }
                                //       : <String, String>{};
                                //   GoRouter.of(context).pushNamed(
                                //       Routes.cardDetailView,
                                //       pathParameters: map);
                                // }
                              },
                              child: const CircleAvatar(
                                radius: 33,
                                backgroundImage:
                                    AssetImage(chatSectionPersonDummyImg2),
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
