import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenSharedCardListing extends StatelessWidget {
  const ScreenSharedCardListing({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSharedCardList();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Cards'),
      ),
      body: Obx(
        () {
          if (controller.sharedCardLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.filteredSharedCards.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Image.asset(emptyDataGif),
                ),
                const Text('No Shared Cards Found')
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: controller.filteredSharedCards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final data = controller.filteredSharedCards[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: controller.sharedCardLoadingId.value == data.id
                            ? kneonShade
                            : kgrey,
                        width: 2,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: kgrey,
                            backgroundImage: data.sharedByProfilePicture != null
                                ? MemoryImage(base64Decode(
                                    data.sharedByProfilePicture ?? ''))
                                : null,
                          ),
                          kHeight5,
                          Text(
                            data.sharedByName ?? '',
                            style: textStyle1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data.sharedByEmail ?? '',
                            style: textThinStyle1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          kHeight10,
                          Obx(() {
                            if (controller.sharedCardLoadingId.value ==
                                data.id) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.acceptOrRejectSharedCard(context,
                                        id: data.id ?? '', accept: false);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kneonShade),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(Icons.clear),
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
                                        color: neonShade,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(Icons.check),
                                  ),
                                )
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
