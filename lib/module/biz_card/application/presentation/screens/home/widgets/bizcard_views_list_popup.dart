import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardViewsListPopUp extends StatelessWidget {
  const BizCardViewsListPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Obx(
      () {
        if (cardController.loadingForCardViews.value) {
          return SizedBox(
            height: 350.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ShimmerLoader(
                height: 50.h,
                seprator: kHeight10,
                itemCount: 4,
                width: 300.w,
              ),
            ),
          );
        } else if (cardController.cardViews.isEmpty) {
          return Center(
            child: Text(
              'No views',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: cardController.cardViews.length,
              itemBuilder: (context, index) {
                final data = cardController.cardViews[index];
                return Card(
                  elevation: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kgrey,
                        child: data.photo != null
                            ? NetworkImageWithLoader(data.photo ?? '')
                            : const Icon(Icons.person),
                      ),
                      title: Text(
                        data.name ?? 'name',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 13),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
