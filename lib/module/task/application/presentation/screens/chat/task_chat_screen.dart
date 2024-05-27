import 'package:bizkit/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenTaskChat extends StatelessWidget {
  const ScreenTaskChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
              title: Text('Task Name'),
              ),
    );
  }
}
