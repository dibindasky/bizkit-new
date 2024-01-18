import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DataManagement extends StatelessWidget {
  const DataManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Data Management',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: const Center(
        child: Text('Data Management'),
      ),
    );
  }
}
