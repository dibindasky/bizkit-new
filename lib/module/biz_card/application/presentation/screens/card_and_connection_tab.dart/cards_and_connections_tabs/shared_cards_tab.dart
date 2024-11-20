// import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SharedCardsTab extends StatelessWidget {
  const SharedCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSharedCardList();
    });

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Obx(
          () => controller.sharedCardLoading.value
              ?const Center(child: CircularProgressIndicator())
              : controller.sharedCards.isEmpty
                  ? Center(
                      child: Text('No shared cards',style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500) ),
                    )
                  : GridView.builder(
                      itemCount: controller.sharedCards.length,
                      // itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.2,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                       
                        final data = controller.sharedCards[index];
                        return Card(
                          elevation: 0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data.sharedByProfilePicture != null
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundColor: kgrey,
                                        backgroundImage: NetworkImage(
                                            data.sharedByProfilePicture ?? ''))
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundColor: kgrey,
                                        backgroundImage: NetworkImage(
                                            data.sharedByProfilePicture ?? '')),
                                kHeight5,
                                Text(
                                  data.sharedByName ?? 'found',
                                  // 'Shared by name',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  data.sharedByEmail ?? 'not found',
                                  // 'Shared by email',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                kHeight10,
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.acceptOrRejectSharedCard(context,
                                            id: data.id ?? '', accept: false);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: kblack,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                          Icons.clear,
                                          color: kwhite,
                                        ),
                                      ),
                                    ),
                                    kWidth20,
                                    GestureDetector(
                                      onTap: () {
                                        controller.acceptOrRejectSharedCard(context,
                                            id: data.id ?? '', accept: true);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: kneon,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                          Icons.check,
                                          size: 24,
                                          color: kwhite,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ));
    // return Obx(
    //   () {
    //     if (controller.sharedCardLoading.value) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (controller.sharedCards.isEmpty) {
    //       return RefreshIndicator(
    //         onRefresh: () async {
    //           controller.getSharedCardList();
    //         },
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 30.h),
    //               child: Image.asset(emptyNodata2),
    //             ),
    //             adjustHieght(10.h),
    //             Text(
    //               'No Shared Cards Found',
    //               style: Theme.of(context).textTheme.displaySmall,
    //             )
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: GridView.builder(
    //           itemCount: controller.sharedCards.length,
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               childAspectRatio: 1 / 1.2,
    //               crossAxisCount: 2,
    //               crossAxisSpacing: 10,
    //               mainAxisSpacing: 10),
    //           itemBuilder: (context, index) {
    //             final data = controller.sharedCards[index];
    //             return Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(
    //                   color: controller.sharedCardLoadingId.value == data.id
    //                       ? kneonShade
    //                       : kgrey,
    //                   width: 2,
    //                 ),
    //               ),
    //               child: FittedBox(
    //                 fit: BoxFit.scaleDown,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 30,
    //                       backgroundColor: kgrey,
    //                       backgroundImage: data.sharedByProfilePicture != null
    //                           ? MemoryImage(base64Decode(
    //                               data.sharedByProfilePicture ?? ''))
    //                           : null,
    //                     ),
    //                     kHeight5,
    //                     Text(
    //                       data.sharedByName ?? '',
    //                       style: textStyle1,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     Text(
    //                       data.sharedByEmail ?? '',
    //                       style: textThinStyle1,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     kHeight10,
    //                     Obx(() {
    //                       if (controller.sharedCardLoadingId.value == data.id) {
    //                         return const Center(
    //                             child: CircularProgressIndicator());
    //                       }
    //                       return Row(
    //                         mainAxisSize: MainAxisSize.max,
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           GestureDetector(
    //                             onTap: () {
    //                               controller.acceptOrRejectSharedCard(context,
    //                                   id: data.id ?? '', accept: false);
    //                             },
    //                             child: Container(
    //                               padding: const EdgeInsets.all(5),
    //                               decoration: BoxDecoration(
    //                                   border: Border.all(color: kneonShade),
    //                                   borderRadius: BorderRadius.circular(100)),
    //                               child: const Icon(Icons.clear),
    //                             ),
    //                           ),
    //                           kWidth20,
    //                           GestureDetector(
    //                             onTap: () {
    //                               controller.acceptOrRejectSharedCard(context,
    //                                   id: data.id ?? '', accept: true);
    //                             },
    //                             child: Container(
    //                               padding: const EdgeInsets.all(5),
    //                               decoration: BoxDecoration(
    //                                   color: neonShade,
    //                                   borderRadius: BorderRadius.circular(100)),
    //                               child: const Icon(Icons.check),
    //                             ),
    //                           )
    //                         ],
    //                       );
    //                     }),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
