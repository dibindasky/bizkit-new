import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/product_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product/product.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: products.isEmpty
            ? const Center(
                child: Text('No products available'),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    adjustHieght(khieght * .04),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          adjustHieght(kwidth * .03),
                      itemCount: products.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = products[index];
                        return SizedBox(
                          height: 260,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: data.image != null &&
                                        data.image!.isNotEmpty
                                    ? Image.memory(
                                        base64.decode(data.image![0].image!
                                                .startsWith('data')
                                            ? data.image![0].image!
                                                .substring(22)
                                            : data.image![0].image!),
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error,
                                                stackTrace) =>
                                            const Icon(Icons
                                                .image_not_supported_outlined))
                                    : null,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  color: klightgrey.withOpacity(.1),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              data.label ?? '',
                                              style: textStyle1.copyWith(
                                                fontSize: kwidth * .04,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          EventButton(
                                            hieght: 35,
                                            wdth: 90,
                                            text: 'View',
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  fadePageRoute(
                                                      ProductViewDetail(
                                                product: data,
                                                myCard: false,
                                              )));
                                            },
                                          ),
                                        ],
                                      ),
                                      adjustWidth(kwidth * .02),
                                      Text(
                                        data.description ?? '',
                                        style: textStyle1.copyWith(
                                          fontSize: kwidth * .03,
                                        ),
                                      ),
                                      adjustWidth(kwidth * .02),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    adjustHieght(khieght * .03),
                  ],
                ),
              ),
      ),
    );
  }
}