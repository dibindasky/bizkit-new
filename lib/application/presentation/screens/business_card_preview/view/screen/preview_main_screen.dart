import 'package:bizkit/application/presentation/screens/business_card_preview/view/widgets/business_card_creation_appbar.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_wice_icons.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';

class BusinessCardCreationPreviewScreen extends StatelessWidget {
  const BusinessCardCreationPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 50),
        child: const BusinessCardCreationPreviewAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 220, child: PreviewPageviewImageBuilder()),
            adjustHieght(khieght * .02),
            Text(
              'Alex Tyler',
              style: TextStyle(fontSize: 26.sp),
            ),
            const Text('Mobile app developer - Flutter'),
            adjustHieght(khieght * .02),
            const PreviewRowWiceIcons(),
            adjustHieght(khieght * .02),
            const PreviewBankPersonAchivedRows(),
            adjustHieght(khieght * .02),
            const PreviewProductsBrandsLists(),
            adjustHieght(khieght * .04),
            AuthButton(
              wdth: 180,
              text: 'Create business card',
              onTap: () {
                Navigator.of(context).push(
                  fadePageRoute(const BizkitBottomNavigationBar()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
