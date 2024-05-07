import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ErrorRefreshIndicator extends StatelessWidget {
  const ErrorRefreshIndicator({
    super.key,
    this.shrinkWrap = false,
    required this.onRefresh,
    this.errorMessage = 'something went wrong pull to refresh',
    this.image,
  });

  final VoidCallback onRefresh;
  final String errorMessage;
  final bool shrinkWrap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(milliseconds: 1500));
      },
      child: ListView(
        shrinkWrap: shrinkWrap,
        children: [
          adjustHieght(50),
          image != null
              ? Image.asset(image!)
              : const Icon(Icons.refresh, color: kgrey),
          Center(child: Text(errorMessage)),
          const SizedBox(width: double.infinity)
        ],
      ),
    );
  }
}
