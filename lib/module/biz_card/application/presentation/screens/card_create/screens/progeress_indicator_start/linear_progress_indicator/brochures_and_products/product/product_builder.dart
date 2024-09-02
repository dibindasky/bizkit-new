import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/product/product_adding_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final bussinessController = Get.find<BusinesDetailsController>();
    final cardController = Get.find<CardController>();
    return SizedBox(
      height: kwidth * 0.2,
      child: Obx(
        () {
          if (cardController.isLoading.value ||
              bussinessController.isLoading.value) {
            return SizedBox(
              height: 100.h,
              child: ShimmerLoader(
                seprator: kWidth10,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                height: 100.h,
                width: 100.h,
              ),
            );
          } else if (cardController
                      .bizcardDetail.value.businessDetails?.product ==
                  null ||
              cardController
                  .bizcardDetail.value.businessDetails!.product!.isEmpty) {
            return SizedBox(
                height: 50.h,
                child: const Center(
                  child: Text('No Products'),
                ));
          }
          return ListView.builder(
            itemCount: cardController
                .bizcardDetail.value.businessDetails!.product!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final product = cardController
                  .bizcardDetail.value.businessDetails?.product?[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      bussinessController.productDataClear();
                      Navigator.push(
                        context,
                        cardFadePageRoute(CardAddPrductsScreen(
                            product: product, selctedIndex: index)),
                      );
                    },
                    child: Container(
                      height: kwidth * 0.2,
                      margin:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      width: kwidth * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: neonShade),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: MemoryImage(
                              base64Decode(product != null &&
                                      product.images != null &&
                                      product.images!.isNotEmpty
                                  ? product.images![0].image ?? ''
                                  : imageTestingBase64.substring(22)),
                            ),
                            onError: (exception, stackTrace) {
                              const Icon(Icons.image_not_supported_outlined);
                            },
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showCustomConfirmationDialogue(
                          context: context,
                          title: 'Are you sure want to delete?',
                          buttonText: 'Delete',
                          onTap: () {
                            bussinessController.productDelete(
                                context: context, productIndex: index);
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const ColoredBox(
                          color: neonShade,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.close, size: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
