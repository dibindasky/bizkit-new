import 'package:bizkit/feature/selfie_card/widgets/selfie_preview_screen.dart';
import 'package:bizkit/feature/selfie_card/widgets/selfie_screen.dart';
import 'package:flutter/material.dart';

class SelfieScreensList extends StatefulWidget {
  SelfieScreensList({super.key});

  @override
  State<SelfieScreensList> createState() => _SelfieScreensListState();
}

class _SelfieScreensListState extends State<SelfieScreensList> {
  final screens = [
    SelfieScreen(),
    SelfiePreviewScreen(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return screens[index];
  }
}
