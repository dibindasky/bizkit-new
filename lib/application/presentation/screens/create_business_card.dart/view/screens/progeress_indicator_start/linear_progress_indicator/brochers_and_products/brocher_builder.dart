import 'dart:convert';

import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/brochure_adding_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class BrocherBuilder extends StatelessWidget {
  const BrocherBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 0.25,
      child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
        builder: (context, state) {
          if (state.brochures.isEmpty) {
            return const Center(
              child: Text(
                '   No Brochures Available',
                style: TextStyle(fontSize: 10),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.brochureLoading
                ? state.brochures.length + 1
                : state.brochures.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BrochureTile(
                  index: index,
                  brochure: index >= state.brochures.length
                      ? null
                      : state.brochures[index]);
            },
          );
        },
      ),
    );
  }
}

class BrochureTile extends StatefulWidget {
  const BrochureTile({
    super.key,
    required this.index,
    required this.brochure,
  });
  final int index;
  final Brochure? brochure;

  @override
  State<BrochureTile> createState() => _BrochureTileState();
}

class _BrochureTileState extends State<BrochureTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.brochure == null) {
      return ShimmerLoaderTile(height: kwidth * 0.2, width: kwidth * 0.18);
    }
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenBrochureAdding(brochure: widget.brochure),
              )),
          child: SizedBox(
            width: kwidth * 0.2,
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.only(right: 10, left: 10),
                  width: kwidth * 0.2,
                  height: kwidth * 0.2,
                  decoration: BoxDecoration(
                    // border: Border.all(color: neonShade),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PdfViewer.openData(
                      base64.decode(widget.brochure!.file!
                          .substring('data:application/pdf;base64,'.length)),
                      params: const PdfViewerParams(pageNumber: 1)),
                ),
                Expanded(child: Text(widget.brochure?.label ?? ''))
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: InkWell(
            onTap: () => showCustomConfirmationDialogue(
                context: context,
                title: 'are you sure want to delete ?',
                buttonText: 'Delete',
                onTap: () {
                  context.read<BusinessDataBloc>().add(
                      BusinessDataEvent.removeBrochure(
                          id: widget.brochure!.id!));
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
