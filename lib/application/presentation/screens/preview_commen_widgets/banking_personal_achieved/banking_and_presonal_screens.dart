import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/commen_banking_personal_tiles.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewBankOrPersnalScreen extends StatelessWidget {
  const PreviewBankOrPersnalScreen({
    super.key,
    required this.isFromBankScreen,
  });

  final bool isFromBankScreen;

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> itemsMap = {
      'BankHeading': [
        'Bank',
        'Account Number',
        'FSC Code',
        'GST No.',
      ],
      'Personalheading': [
        'Blood Group',
        'Office Address',
        'Home Address',
      ],
      'BankSubtittle': [
        '1962 XXXX XXXX XXXX',
        '1962 XXXX XXXX XXXX',
        '1962 XXXX XXXX XXXX',
        '1962 XXXX XXXX XXXX'
      ],
      'PersonalSubtittle': [
        'AB Negative',
        'Lorem Ipsum',
        'Lorem Ipsum',
      ],
    };
    String firstCategory = isFromBankScreen ? 'BankHeading' : 'Personalheading';
    String secondCategory =
        isFromBankScreen ? 'BankSubtittle' : 'PersonalSubtittle';
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
            children: [
              ListView.builder(
                itemCount: isFromBankScreen
                    ? itemsMap['BankHeading']!.length
                    : itemsMap['Personalheading']!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommenbankingPersnalTiles(
                    first: itemsMap[firstCategory]![index],
                    second: itemsMap[secondCategory]![index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
