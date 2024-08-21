import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocher_and_products_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CardProductsBrandsLists extends StatelessWidget {
  const CardProductsBrandsLists({super.key});

  // final List<Product> networkImages;
  // final List<Brochure> pdf;

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
                      const CardBrochursAndProductsTab(),
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
                child: const Center(
                  child: Text(
                    'Products and Brochures are not available',
                    style: TextStyle(fontSize: 12),
                  ),
                )

                //  ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       ListView.separated(
                //         itemCount: networkImages.length,
                //         shrinkWrap: true,
                //         separatorBuilder: (context, index) =>
                //             adjustWidth(kwidth * .01),
                //         physics: const BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //           return InkWell(
                //             onTap: () => Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => CardProductDetailView(
                //                         product: networkImages[index],
                //                         myCard: false,
                //                       )),
                //             ),
                //             child: AspectRatio(
                //               aspectRatio: 0.9,
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: ColoredBox(
                //                   color: smallBigGrey,
                //                   child: networkImages[index].image != null &&
                //                           networkImages[index]
                //                               .image!
                //                               .isNotEmpty
                //                       ? Image.memory(
                //                           base64.decode(networkImages[index]
                //                                   .image![0]
                //                                   .image!
                //                                   .startsWith('data')
                //                               ? networkImages[index]
                //                                   .image![0]
                //                                   .image!
                //                                   .substring(22)
                //                               : networkImages[index]
                //                                   .image![0]
                //                                   .image!),
                //                           fit: BoxFit.cover,
                //                           errorBuilder: (context, error,
                //                                   stackTrace) =>
                //                               const Icon(Icons
                //                                   .image_not_supported_outlined),
                //                         )
                //                       : null,
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //       adjustWidth(kwidth * .01),
                //       ListView.separated(
                //         shrinkWrap: true,
                //         separatorBuilder: (context, index) => adjustWidth(
                //           kwidth * .01,
                //         ),
                //         physics: const BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //           return InkWell(
                //             onTap: () => Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => ScreenPdfPreview(
                //                         label: pdf[index].label ?? '',
                //                         base64: pdf[index].file!.substring(
                //                             'data:application/pdf;base64,'
                //                                 .length),
                //                       )),
                //             ),
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(10),
                //               child: ColoredBox(
                //                 color: smallBigGrey,
                //                 child: AspectRatio(
                //                   aspectRatio: 0.9,
                //                   child: PdfViewer.openData(
                //                       base64Decode(pdf[index].file!.substring(
                //                           'data:application/pdf;base64,'
                //                               .length)),
                //                       params: const PdfViewerParams(
                //                           pageNumber: 1)),
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //         itemCount: pdf.length,
                //       ),
                //     ],
                //   ),
                ),
          ),
        ],
      ),
    );
  }
}
