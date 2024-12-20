import 'dart:convert';
import 'dart:developer';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/linear_progress_indicator/brochures_and_products/brochure/brochure_adding_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class BrochureBuilder extends StatelessWidget {
  const BrochureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final businessController = Get.find<BusinesDetailsController>();
    return Obx(
      () {
        if (cardController.isLoading.value ||
            businessController.brochureLoading.value) {
          return SizedBox(
            height: kwidth * 0.2,
            child: ShimmerLoader(
              seprator: kWidth10,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              height: kwidth * 0.5,
              width: kwidth * 0.2,
            ),
          );
        } else if (cardController
                    .bizcardDetail.value.businessDetails?.brochure ==
                null ||
            cardController
                .bizcardDetail.value.businessDetails!.brochure!.isEmpty) {
          return SizedBox(
              height: 50.h,
              child: const Center(
                child: Text('No Brochures'),
              ));
        }
        return SizedBox(
          height: kwidth * 0.26,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: cardController
                .bizcardDetail.value.businessDetails!.brochure!.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BrochureTile(
                index: index,
                brochure: cardController
                    .bizcardDetail.value.businessDetails!.brochure![index],
              );
            },
          ),
        );
      },
    );
  }
}

class BrochureTile extends StatefulWidget {
  const BrochureTile({super.key, required this.index, this.brochure});
  final int index;
  final Brochure? brochure;

  @override
  State<BrochureTile> createState() => _BrochureTileState();
}

class _BrochureTileState extends State<BrochureTile> {
  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenBrochureAdding(
                  brochure: widget.brochure,
                  selectedIndex: widget.index,
                ),
              )),
          child: Container(
            height: kwidth * 0.4,
            margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
            width: kwidth * 0.2,
            decoration: BoxDecoration(
              border: Border.all(color: neonShade),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: kwidth * 0.2,
                  height: kwidth * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PdfViewer.openData(
                      base64.decode(widget.brochure!.file!.startsWith('data')
                          ? widget.brochure!.file!
                              .substring('data:application/pdf;base64,'.length)
                          : widget.brochure!.file!),
                      params: const PdfViewerParams(pageNumber: 1)),
                ),
                kHeight5,
                Expanded(
                    child: Text(
                  widget.brochure?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 1,
          right: 5,
          child: InkWell(
            onTap: () => showCustomConfirmationDialogue(
                context: context,
                title: 'Are you sure you want to delete ?',
                buttonText: 'Delete',
                onTap: () {
                  businessController.brochureDelete(
                      context: context, bruchureIndex: widget.index);
                }),
            borderRadius: BorderRadius.circular(10),
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
  }
}
