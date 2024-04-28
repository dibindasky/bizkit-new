import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomShaowCaseView extends StatelessWidget {
  const CustomShaowCaseView({
    super.key,
    required this.globalKey,
    required this.description,
    required this.tittle,
    required this.child,
  });
  final GlobalKey globalKey;
  final String description;
  final String tittle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey,
      title: tittle,
      description: description,
      child: child,
    );
  }
}
