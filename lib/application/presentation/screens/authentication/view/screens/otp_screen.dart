import 'package:flutter/material.dart';

class ScreenOtpValidation extends StatelessWidget {
  const ScreenOtpValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Text('Enter OTP to verify'),
        Text('A 6 digit OTP has been sent to your mail address example@123.com'),
      ],
    ));
  }
}
