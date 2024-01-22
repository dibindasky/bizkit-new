import 'package:bizkit/application/presentation/screens/business_card_preview/view/widgets/show_model_items.dart';
import 'package:bizkit/application/presentation/utils/previewscreen_icons/detail_sharing_icon.dart';
import 'package:flutter/material.dart';

class PreviewRowWiceIcons extends StatelessWidget {
  const PreviewRowWiceIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => const PreviewScreenRowIconsModelSheetItems(
              isPhone: true,
            ),
          ),
          child: const DetailSharingIconWidget(
            image: 'asset/images/preview phone.png',
          ),
        ),
        const DetailSharingIconWidget(
          image: 'asset/images/preview messages gif.gif',
        ),
        const DetailSharingIconWidget(
          image: 'asset/images/preview globe.gif',
        ),
        GestureDetector(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => const PreviewScreenRowIconsModelSheetItems(
              isPhone: false,
            ),
          ),
          child: const DetailSharingIconWidget(
            image: 'asset/images/preview_spinner.png',
          ),
        ),
        const DetailSharingIconWidget(
          image: 'asset/images/preview location gif.gif',
        ),
      ],
    );
  }
}
