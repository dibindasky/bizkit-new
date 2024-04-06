import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/pdf/pdf_preview_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
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
      height: kwidth * 0.2,
      child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.brochures.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenPdfPreview(
                              base64: state.brochures[index].file),
                        )),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      width: kwidth * 0.2,
                      decoration: BoxDecoration(
                        // border: Border.all(color: neonShade),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: PdfViewer.openFile(
                          state.brochures[index].file!,
                          params: const PdfViewerParams(pageNumber: 1)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: InkWell(
                      onTap: () => context
                          .read<BusinessDataBloc>()
                          .add(BusinessDataEvent.removeBrochure(index: index)),
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
            },
          );
        },
      ),
    );
  }
}
