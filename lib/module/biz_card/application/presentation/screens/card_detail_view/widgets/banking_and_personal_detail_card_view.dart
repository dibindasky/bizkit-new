import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/commen_banking_personal_tiles.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenPreviewBankOrPersnalCArdView extends StatelessWidget {
  const ScreenPreviewBankOrPersnalCArdView({
    super.key,
    required this.isFromBankScreen,
  });

  final bool isFromBankScreen;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          isFromBankScreen ? 'Bank Details' : 'Personal Details',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: !isFromBankScreen
                ? [
                    CardBankingPersonalTiles(
                      first: 'Blood Group',
                      second:
                          cardController.personalDetails.value?.bloodGroup ??
                              '',
                    )
                  ]
                : [
                    const CardBankingPersonalTiles(
                      first: 'Account Number',
                      second: '785275'
                          '',
                    ),
                    const CardBankingPersonalTiles(
                      first: 'IFSC',
                      second: '23554',
                    ),
                    const CardBankingPersonalTiles(
                      first: 'GST ',
                      second: '',
                    ),
                    Image.asset(emptyNodata3)
                  ],
          ),
        ),
      ),
    );
  }
}