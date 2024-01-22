import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_wice_icons.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/widgets/image_offset_container.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            color: backgroundColour,
            icon: const Icon(
              Icons.more_vert,
              size: 23,
              color: kwhite,
            ),
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Edit Bizkit card',
                child: Text('Edit Bizkit card'),
              ),
              const PopupMenuItem(
                value: 'Add information',
                child: Text('Add information'),
              ),
              const PopupMenuItem(
                value: 'Report a problem',
                child: Text('Report a problem'),
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'My Bizkit Card Preview',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 220,
              child: ImageOffsetContainers(),
            ),
            adjustHieght(khieght * .02),
            Text(
              'Alex Tyler',
              style: TextStyle(fontSize: 26.sp),
            ),
            const Text('Mobile app developer - Flutter'),
            adjustHieght(khieght * .02),
            const PreviewRowWiceIcons(),
            adjustHieght(khieght * .02),
            const BankPersonAchivedRows(),
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
