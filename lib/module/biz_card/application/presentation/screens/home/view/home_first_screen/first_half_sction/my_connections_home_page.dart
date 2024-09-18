import 'dart:developer';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/first_half_sction/widgets/cards_based_on_user.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardMyConnectionContainerHomePage extends StatelessWidget {
  const CardMyConnectionContainerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectionsController.fetchMyConnections(true);
    });
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My connections', style: textHeadStyle1),
              GestureDetector(
                onTap: () {
                  connectionsController.searchConnections(
                      searchQuery: SearchQuery(search: ''));
                  connectionsController.fetchRecievedConnectionRequests();
                  GoRouter.of(context)
                      .pushNamed(Routes.myAllConnectionsAndContacts);
                  // Navigator.of(context).push(
                  //     cardFadePageRoute(const MyConnectionsViewAllContacts()));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(1)),
                  child: ColoredBox(
                    color: backgroundColour,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      // child: CustomShowCaseView(
                      //   image: personImage,
                      //   globalKey: globalKeyViewAllConnections,
                      //   tittle: 'View your added conecctions',
                      //   description: '',
                      //   child: Text(
                      //     'View All',
                      //     style: textThinStyle1.copyWith(
                      //         decorationColor: kwhite,
                      //         decorationThickness: 1.5,
                      //         color: kwhite,
                      //         fontSize: 10.sp),
                      //   ),
                      // ),
                      child: Text(
                        'View All',
                        style: textThinStyle1.copyWith(
                            decorationColor: kwhite,
                            decorationThickness: 1.5,
                            color: kwhite,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(khieght * .03),
        SizedBox(
          width: double.infinity,
          height: 75,
          child: Obx(
            () {
              if (connectionsController.myConnectionsLoading.value) {
                return ShimmerLoader(
                    seprator: adjustWidth(kwidth * .02),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    height: 20.h,
                    width: 75.w);
              } else if (connectionsController.myConnections.isEmpty) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () {
                            connectionsController.searchBizkitUsers(
                                searchQuery: SearchQuery(search: ''));
                            GoRouter.of(context)
                                .pushNamed(Routes.addConnection);
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
                                style: textThinStyle1,
                              )),
                            ],
                          ),
                        ),
                      ),
                      const Text('No connections'),
                      kWidth20
                    ],
                  ),
                );
              } else {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      adjustWidth(kwidth * .02),
                  itemCount: connectionsController.myConnections.length == null
                      ? 1
                      : connectionsController.myConnections.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    MyConnection data = MyConnection();
                    if (index != 0) {
                      data = connectionsController.myConnections[index - 1];
                    }
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () {
                            connectionsController.searchBizkitUsers(
                                searchQuery: SearchQuery(search: ''));
                            GoRouter.of(context)
                                .pushNamed(Routes.addConnection);
                          },
                          // child: CustomShowCaseView(
                          //   description: '',
                          //   globalKey: globalKeyaddConnections,
                          //   tittle: 'Start Add connections from here',
                          //   image: '',
                          //   child: Column(
                          //     children: [
                          //       ClipRRect(
                          //         borderRadius: BorderRadius.circular(12),
                          //         child: ColoredBox(
                          //           color: textFieldFillColr,
                          //           child: SizedBox(
                          //             height: 47.h,
                          //             width: 50.w,
                          //             child: Center(
                          //               child: Icon(
                          //                 Icons.add,
                          //                 size: 18.h,
                          //                 color: kwhite,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       const Expanded(child: Text('Add')),
                          //     ],
                          //   ),
                          // ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: ColoredBox(
                                  color: textFieldFillColr,
                                  child: SizedBox(
                                    height: 45.h,
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
                                  child: Text('Add', style: textThinStyle1)),
                            ],
                          ),
                        ),
                      );
                    }
                    final cIndex = index - 1;
                    return InkWell(
                      onTap: () {
                        if ((connectionsController
                                    .myConnections[cIndex].cards?.length ??
                                0) >
                            1) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: BeveledRectangleBorder(
                                  borderRadius: kBorderRadius10),
                              child: CardsbasedOnUserConnection(
                                  card: connectionsController
                                      .myConnections[cIndex].cards),
                            ),
                          );
                        } else {
                          final id = connectionsController
                              .myConnections[cIndex].cards
                              ?.map((e) => e.toCard)
                              .toList();
                          Map<String, String> map = id != null
                              ? {'myCard': 'false', 'cardId': id.first ?? ''}
                              : <String, String>{};
                          GoRouter.of(context).pushNamed(Routes.cardDetailView,
                              pathParameters: map);
                        }
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset(
                            dummyPersonImage,
                            height: 30.h,
                            width: 50.w,
                            fit: BoxFit.cover,
                          )),
                          Text(data.username ?? 'Name',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center)
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
