import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardProductsOrBrands extends StatelessWidget {
  const BizCardProductsOrBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight20,
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Products/Brands',
                style: Theme.of(context).textTheme.displaySmall),
          ),
          kHeight5,
          SizedBox(
            height: 100.h,
            child: Obx(
              () => cardController.isLoading.value
                  ? ShimmerLoader(
                      seprator: kWidth10,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      height: 100.h,
                      width: 80.h)
                  : (cardController.bizcardDetail.value.businessDetails?.product
                              ?.isEmpty ??
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
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ],
                        )
                      : ListView.builder(
                          itemCount: cardController.bizcardDetail.value
                                  .businessDetails?.product?.length ??
                              0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = cardController.bizcardDetail.value
                                .businessDetails!.product![index];
                            return AspectRatio(
                              aspectRatio: 0.9,
                              child: GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                    Routes.cardProductDetail,
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: kBorderRadius10,
                                    border: Border.all(
                                        color: kGrayLight, width: 0.3),
                                  ),
                                  child: NetworkImageWithLoader(
                                    product.images?.first ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
