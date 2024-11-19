import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardProductsOrBrands extends StatelessWidget {
  const BizCardProductsOrBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardConroller = Get.find<CardController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        kHeight20,
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Products/Brands',
              style: Theme.of(context).textTheme.displaySmall),
        ),
        kHeight5,
        SizedBox(
          height: 100.h,
          child: Obx(() => (cardConroller
                      .bizcardDetail.value.businessDetails?.product?.isEmpty ??
                  true)
              ? Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 0.9,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: kBorderRadius10,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.3)),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    kWidth10,
                    Text('No products available',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(borderRadius: kBorderRadius10),
                      child: const NetworkImageWithLoader(
                        imageDummyNetwork,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
        ),
      ]),
    );
  }
}
