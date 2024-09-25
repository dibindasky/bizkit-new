import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(),
      body: Obx(
        () {
          if (controller.sharedCardLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.sharedCards.isEmpty) {
            return const Text('No Cards found');
          } else {
            return ListView.builder(
              itemCount: controller.sharedCards.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                // final data = SharedCardModel();
                final data = controller.sharedCards[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kgrey,
                    backgroundImage: data.sharedByProfilePicture != null
                        ? MemoryImage(
                            base64Decode(data.sharedByProfilePicture ?? ''))
                        : null,
                  ),
                  title: Text(data.sharedByName ?? ''),
                  subtitle: Text(data.sharedByEmail ?? ''),
                  trailing: Wrap(
                    children: [
                      GestureDetector(
                          onTap: () => controller.acceptOrRejectSharedCard(
                              context,
                              accept: true,
                              id: data.id ?? ''),
                          child: const Icon(Icons.check)),
                      GestureDetector(
                          onTap: () => controller.acceptOrRejectSharedCard(
                              context,
                              accept: false,
                              id: data.id ?? ''),
                          child: const Icon(Icons.close))
                    ],
                  ),
                );

              },
            );
            // return GridView.builder(
            //   itemCount: controller.sharedCards.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2),
            //   itemBuilder: (context, index) {
            //     final data = controller.sharedCards[index];
            //     return GridTile(child: Text(data.sharedByName ?? ''),
            //     footer: Row(children: List.generate(2,(i) => CircleAvatar(backgroundColor: kgrey,)),),);
            //   },
            // );
          }
        },
      ),
    );
  }
}
