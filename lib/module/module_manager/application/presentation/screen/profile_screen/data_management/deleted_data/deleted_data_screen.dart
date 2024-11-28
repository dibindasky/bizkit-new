import 'package:flutter/material.dart';

class DeletedCardScreen extends StatelessWidget {
  const DeletedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'deleted',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
