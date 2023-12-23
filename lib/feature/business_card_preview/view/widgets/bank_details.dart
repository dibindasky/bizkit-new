import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_detail_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Bank Details',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BankItemWidget(
                first: 'Bank',
                second: 'ICICI Bank',
              ),
              BankItemWidget(
                first: 'Account Number',
                second: '1962 XXXX XXXX XXXX',
              ),
              BankItemWidget(
                first: 'IFSC Code',
                second: '1962 XXXX XXXX XXXX',
              ),
              BankItemWidget(
                first: 'GST No.',
                second: '1962 XXXX XXXX XXXX',
              ),
              BankItemWidget(
                first: 'UPI ID',
                second: '1962 XXXX XXXX XXXX',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
