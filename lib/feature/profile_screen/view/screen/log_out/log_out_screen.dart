import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

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
          'Logout',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: const Center(
        child: Text('LogOutScreen'),
      ),
    );
  }
}
