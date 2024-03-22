import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorCustom extends StatelessWidget {
  const RefreshIndicatorCustom({
    super.key,
    required this.message,
    required this.onRefresh,
    this.image,
    this.height = 0.3,
  });
  final String message;
  final VoidCallback onRefresh;
  final double height;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(seconds: 2));
      },
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => SizedBox(
          height: height * khieght,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null ? const Icon(Icons.refresh) : Expanded(child: Image.asset(image!)),
              adjustHieght(20),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
