import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardUpdateProductDetails extends StatelessWidget {
  const CardUpdateProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bussinessController = Get.find<BusinesDetailsController>();
    final cardController = Get.find<CardController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GetBuilder<CardController>(builder: (cotext) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Products/Brands',
                      style: Theme.of(context).textTheme.displayMedium),
                  kHeight10,
                  (cardController.bizcardDetail.value.businessDetails?.product
                                  ?.length ??
                              0) ==
                          0
                      ? kempty
                      : Text('Added Products',
                          style: Theme.of(context).textTheme.displaySmall),
                  kHeight10,
                  (cardController.bizcardDetail.value.businessDetails?.product
                                  ?.length ??
                              0) ==
                          0
                      ? kempty
                      : const ProductBuilder(),
                  (cardController.bizcardDetail.value.businessDetails?.product
                                  ?.length ??
                              0) ==
                          0
                      ? kempty
                      : kHeight30,
                  Center(
                    child: InkWell(
                      onTap: () async {
                        GoRouter.of(context)
                            .pushNamed(Routes.cardProductsCreateOrUpdate);
                        bussinessController.productDataClear();
                      },
                      child: DottedBorder(
                        dashPattern: const [8, 8],
                        color: Theme.of(context).colorScheme.surface,
                        strokeWidth: 2.5,
                        child: SizedBox(
                          width: 290.dm,
                          height: 81.dm,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                              Text('Add Products',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // kHeight20,
                  // (cardController.bizcardDetail.value.businessDetails?.brochure
                  //                 ?.length ??
                  //             0) ==
                  //         0
                  //     ? kempty
                  //     : const Text('Added Brochures'),
                  // kHeight10,
                  // (cardController.bizcardDetail.value.businessDetails?.brochure
                  //                 ?.length ??
                  //             0) ==
                  //         0
                  //     ? kempty
                  //     : const BrochureBuilder(),
                  // (cardController.bizcardDetail.value.businessDetails?.brochure
                  //                 ?.length ??
                  //             0) ==
                  //         0
                  //     ? kempty
                  //     : kHeight30,
                  // Center(
                  //   child: InkWell(
                  //     onTap: () async {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const ScreenBrochureAdding(),
                  //           ));
                  //       bussinessController.brochureDataClear();
                  //     },
                  //     child: DottedBorder(
                  //       dashPattern: const [8, 8],
                  //       color: neonShade,
                  //       strokeWidth: 2.5,
                  //       child: SizedBox(
                  //         width: 290.dm,
                  //         height: 81.dm,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SizedBox(
                  //               width: 32.dm,
                  //               height: 32.dm,
                  //               child: const CircleAvatar(
                  //                 child: Icon(
                  //                   Icons.add,
                  //                 ),
                  //               ),
                  //             ),
                  //             Text(
                  //               'Add Brochures',
                  //               style: TextStyle(fontSize: 10.sp),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  adjustHieght(30),
                  kHeight30,
                ],
              );
            }),
            adjustHieght(khieght * .01),
            // SkipOrContinueButtons(
            //   onTap: () {
            //     // if (fromBusiness) {
            //     //   pageController.nextPage(
            //     //     duration: const Duration(milliseconds: 500),
            //     //     curve: Curves.ease,
            //     //   );
            //     // } else {
            //     //   Navigator.pop(context);
            //     // }
            //   },
            // ),
            adjustHieght(30),
          ],
        ),
      ),
    );
  }
}

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
          // if (cardController.isLoading.value ||
          //     bussinessController.isLoading.value) {
          //   return SizedBox(
          //     height: 100.h,
          //     child: ShimmerLoader(
          //       seprator: kWidth10,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 4,
          //       height: 100.h,
          //       width: 100.h,
          //     ),
          //   );
          // } else
          if (cardController.bizcardDetail.value.businessDetails?.product ==
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
                      GoRouter.of(context).pushNamed(
                          Routes.cardProductsCreateOrUpdate,
                          extra: {'index': index, 'product': product});
                    },
                    child: Container(
                      height: kwidth * 0.2,
                      margin:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      width: kwidth * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: kBorderRadius10,
                        // image: DecorationImage(
                        //   image: MemoryImage(
                        //     base64Decode(product != null &&
                        //             product.images != null &&
                        //             product.images!.isNotEmpty
                        //         ? product.images![0].image ?? ''
                        //         : imageTestingBase64.substring(22)),
                        //   ),
                        //   onError: (exception, stackTrace) {
                        //     const Icon(Icons.image_not_supported_outlined);
                        //   },
                        //   filterQuality: FilterQuality.high,
                        //   fit: BoxFit.cover,
                        // )
                      ),
                      child: NetworkImageWithLoader(
                          product?.images?.first ?? '',
                          radius: 10),
                    ),
                  ),
                  if (!bussinessController.isLoading.value &&
                      !bussinessController.deleteProductIds
                          .contains(product?.id ?? ''))
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
