import 'package:flutter/material.dart';

class AttendenceCalenderScreen extends StatelessWidget {
  const AttendenceCalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(child: Text('Attendence Calender Screen')),
      ),
    );
  }
}
