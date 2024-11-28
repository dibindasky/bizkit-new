import 'package:flutter/material.dart';

class ArchivedCardScreen extends StatelessWidget {
  const ArchivedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'archived',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
