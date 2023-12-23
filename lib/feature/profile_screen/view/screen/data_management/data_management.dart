import 'package:bizkit/core/const.dart';
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
            Icons.arrow_back,
            color: kwhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Data Management',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Center(
        child: Text('Data Management'),
      ),
    );
  }
}
