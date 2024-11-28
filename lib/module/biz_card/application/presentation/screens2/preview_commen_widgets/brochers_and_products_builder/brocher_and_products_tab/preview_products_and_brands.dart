import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/pdf/pdf_preview_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocher_and_products_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/product_detail_view.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class CardProductsBrandsLists extends StatelessWidget {
  const CardProductsBrandsLists(
      {super.key, required this.networkImages, required this.pdf});

  final List<Product> networkImages;
  final List<Brochure> pdf;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: bottomsheetContainerclr,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      height: khieght * .18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          adjustHieght(khieght * .01),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Brochures and Products'),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    cardFadePageRoute(
                      CardBrochursAndProductsTab(
                          networkImages: networkImages, pdf: pdf),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10.h),
                    decoration: BoxDecoration(
                      color: neonShade,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.arrow_right),
                  ),
                ),
              ],
            ),
          ),
          adjustHieght(khieght * .02),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: double.infinity,
              height: kwidth * .2,
              child: networkImages.isEmpty && pdf.isEmpty
                  ? const Center(
                      child: Text(
                        'Products and Brochures are not available',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ListView.separated(
                          itemCount: networkImages.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              adjustWidth(kwidth * .01),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardProductDetailView(
                                          product: networkImages[index],
                                          myCard: false,
                                        )),
                              ),
                              child: AspectRatio(
                                aspectRatio: 0.9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ColoredBox(
                                    color: smallBigGrey,
                                    child: networkImages[index].images !=
                                                null &&
                                            networkImages[index]
                                                .images!
                                                .isNotEmpty
                                        ? Image.memory(
                                            base64.decode(networkImages[index]
                                                    .images![0]
                                                    .startsWith('data')
                                                ? networkImages[index]
                                                    .images![0]
                                                    .substring(22)
                                                : networkImages[index]
                                                    .images![0]),
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                const Icon(Icons
                                                    .image_not_supported_outlined),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        adjustWidth(kwidth * .01),
                        ListView.separated(
                          itemCount: pdf.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => adjustWidth(
                            kwidth * .01,
                          ),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenPdfPreview(
                                          label: pdf[index].title ?? '',
                                          base64: pdf[index]
                                                  .file!
                                                  .startsWith('data')
                                              ? pdf[index].file!.substring(
                                                  'data:application/pdf;base64,'
                                                      .length)
                                              : pdf[index].file!,
                                        )),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ColoredBox(
                                  color: smallBigGrey,
                                  child: AspectRatio(
                                    aspectRatio: 0.9,
                                    child: PdfViewer.openData(
                                        base64Decode(pdf[index]
                                                .file!
                                                .startsWith('data')
                                            ? pdf[index].file!.substring(
                                                'data:application/pdf;base64,'
                                                    .length)
                                            : pdf[index].file!),
                                        params: const PdfViewerParams(
                                            pageNumber: 1)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
