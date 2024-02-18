import 'dart:io';

import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/brocher_and_products_tab.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PreviewProductsBrandsLists extends StatelessWidget {
  const PreviewProductsBrandsLists(
      {super.key, this.fileImages, this.networkImages});

  final List<File>? fileImages;
  final List<String>? networkImages;

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
                const Text('Brochers and Products'),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(
                      const BrochersAndProductsTab(),
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
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => adjustWidth(
                  kwidth * .01,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: smallBigGrey,
                      child: networkImages != null
                          ? Image.network(networkImages![index])
                          : Image.file(
                              fileImages![index],
                            ),
                    ),
                  );
                },
                itemCount: networkImages != null
                    ? networkImages!.length
                    : fileImages!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
