import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/brochure/brochure_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/brochure/brochure_adding_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/product/product_adding_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/product/product_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrochersAndProductsScreen extends StatelessWidget {
  const BrochersAndProductsScreen(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final bussinessController = Get.find<BusinesDetailsController>();
    final cardController = Get.find<CardController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder<CardController>(builder: (cotext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Products / Brochures',
                    style: TextStyle(fontSize: 20)),
                kHeight10,
                (cardController.bizcardDetail.value.businessDetails?.product
                                ?.length ??
                            0) ==
                        0
                    ? kempty
                    : const Text('Added Products'),
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
                      Navigator.push(context,
                          cardFadePageRoute(const CardAddPrductsScreen()));
                      bussinessController.productDataClear();
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
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
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                            Text(
                              'Add Products',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                kHeight20,
                (cardController.bizcardDetail.value.businessDetails?.brochure
                                ?.length ??
                            0) ==
                        0
                    ? kempty
                    : const Text('Added Brochures'),
                kHeight10,
                (cardController.bizcardDetail.value.businessDetails?.brochure
                                ?.length ??
                            0) ==
                        0
                    ? kempty
                    : const BrochureBuilder(),
                (cardController.bizcardDetail.value.businessDetails?.brochure
                                ?.length ??
                            0) ==
                        0
                    ? kempty
                    : kHeight30,
                Center(
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenBrochureAdding(),
                          ));
                      bussinessController.brochureDataClear();
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
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
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                            Text(
                              'Add Brochures',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                adjustHieght(30),
                kHeight30,
              ],
            );
          }),
          adjustHieght(khieght * .01),
          CardLastSkipContinueButtons(
            onTap: () {
              if (fromBusiness) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          adjustHieght(30),
        ],
      ),
    );
  }
}
