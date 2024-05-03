import 'dart:convert';

import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/pdf/pdf_preview_screen.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocher_and_products_tab.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/product_detail_view.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PreviewProductsBrandsLists extends StatelessWidget {
  const PreviewProductsBrandsLists(
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
                    fadePageRoute(
                      BrochersAndProductsTab(
                          networkImages: networkImages, pdf: pdf),
                    ),
                  ),
                  child: Container(
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
                                    builder: (context) => ProductViewDetail(
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
                                    child: networkImages[index].image != null &&
                                            networkImages[index]
                                                .image!
                                                .isNotEmpty
                                        ? Image.memory(
                                            base64.decode(networkImages[index]
                                                    .image![0]
                                                    .image!
                                                    .startsWith('data')
                                                ? networkImages[index]
                                                    .image![0]
                                                    .image!
                                                    .substring(22)
                                                : networkImages[index]
                                                    .image![0]
                                                    .image!),
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
                          itemCount: networkImages.length,
                        ),
                        adjustWidth(kwidth * .01),
                        ListView.separated(
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
                                          base64: pdf[index].file!.substring(
                                              'data:application/pdf;base64,'
                                                  .length),
                                        )),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ColoredBox(
                                  color: smallBigGrey,
                                  child: AspectRatio(
                                    aspectRatio: 0.9,
                                    child: PdfViewer.openData(
                                        base64Decode(pdf[index].file!.substring(
                                            'data:application/pdf;base64,'
                                                .length)),
                                        params: const PdfViewerParams(
                                            pageNumber: 1)),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: pdf.length,
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
