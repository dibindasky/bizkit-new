import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Connections',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          adjustHieght(20.h),
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
                            onTap: () {},
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
                                  style: textThinStyle1,
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
                  return ListView.separated(
                    controller:
                        connectionsController.fetchMyConnectionScrollController,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        adjustWidth(kwidth * .02),
                    itemCount: connectionsController.myConnections.length +
                        (connectionsController.fetchMyconnectionLoadMore.value
                            ? 1
                            : 0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == connectionsController.myConnections.length &&
                          connectionsController
                              .fetchMyconnectionLoadMore.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Get connection data directly from index
                      final connection =
                          connectionsController.myConnections[index];

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
                              radius: 35,
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
    );
  }
}
