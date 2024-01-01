import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankPersonAchivedRows extends StatelessWidget {
  const BankPersonAchivedRows({
    Key? key,
    required this.first,
    required this.scnd,
    required this.third,
  }) : super(key: key);
  final String first;
  final String scnd;
  final String third;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const BankDetails()),
              ),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: klightgrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(first),
                    Text('Banking', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: lightColr,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(scnd),
                  Text('Personal', style: TextStyle(fontSize: 10.sp)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: lightColr,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(third),
                  Text(
                    'Achieved',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
