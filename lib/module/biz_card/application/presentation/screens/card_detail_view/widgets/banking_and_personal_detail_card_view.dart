import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/commen_banking_personal_tiles.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardScreenPreviewBankOrPersonal extends StatelessWidget {
  const CardScreenPreviewBankOrPersonal({
    super.key,
    required this.isFromBankScreen,
  });

  final bool isFromBankScreen;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final bankDetails =
        cardController.bizcardDetail.value.businessDetails?.bankingDetails;
    final personalDetails = cardController.bizcardDetail.value.personalDetails;
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
                    GetBuilder<CardController>(builder: (context) {
                      if (personalDetails?.name == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Name',
                        second: personalDetails?.name ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (context) {
                      if (personalDetails?.bloodGroup == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Blood Group',
                        second: personalDetails?.bloodGroup ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (context) {
                      if (personalDetails?.email == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Email',
                        second: personalDetails?.email ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (context) {
                      if (personalDetails?.phone?.first == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Phone Number',
                        second: personalDetails?.phone?.first ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (contxt) {
                      if (personalDetails?.bloodGroup == null &&
                          personalDetails?.email == null &&
                          personalDetails?.phone?.first == null) {
                        return Column(
                          children: [
                            Image.asset(emptyNodata2, height: 400.h),
                            const Text('Bank details empty')
                          ],
                        );
                      }
                      return kempty;
                    })
                  ]
                : [
                    GetBuilder<CardController>(builder: (conext) {
                      if (bankDetails?.bankingName == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Banking Namer',
                        second: bankDetails?.bankingName ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (conxt) {
                      if (bankDetails?.accountNumber == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'Account Number',
                        second: bankDetails?.accountNumber ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (cotext) {
                      if (bankDetails?.ifscCode == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                          first: 'IFSC', second: bankDetails?.ifscCode ?? '');
                    }),
                    GetBuilder<CardController>(builder: (contet) {
                      if (bankDetails?.upi == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'UPI ',
                        second: bankDetails?.upi ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (cotext) {
                      if (bankDetails?.gst == null) {
                        return kempty;
                      }
                      return CardBankingPersonalTiles(
                        first: 'GST ',
                        second: bankDetails?.gst ?? '',
                      );
                    }),
                    GetBuilder<CardController>(builder: (contxt) {
                      if (bankDetails?.gst == null &&
                          bankDetails?.upi == null &&
                          bankDetails?.ifscCode == null &&
                          bankDetails?.accountNumber == null &&
                          bankDetails?.bankingName == null) {
                        return Column(
                          children: [
                            Image.asset(emptyNodata2, height: 400.h),
                            const Text('Personal details empty')
                          ],
                        );
                      }
                      return kempty;
                    })
                  ],
          ),
        ),
      ),
    );
  }
}
