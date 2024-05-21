import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomShowCaseView extends StatelessWidget {
  const CustomShowCaseView({
    super.key,
    required this.globalKey,
    required this.description,
    required this.tittle,
    required this.child,
    required this.image,
  });
  final GlobalKey globalKey;
  final String description;
  final String tittle;
  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey, description: tittle,
      titleTextStyle: textStyle1.copyWith(color: kblack), child: child,
      //  Showcase.withWidget(
      //   height: double.maxFinite,
      //   width: double.infinity,
      //   key: globalKey,
      //   container: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Image.asset(
      //         image,
      //         height: 200,
      //         width: 200,
      //         fit: BoxFit.cover,
      //       ),
      //       const SizedBox(height: 16.0),
      //       Text(
      //         tittle,
      //         style:
      //             const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(height: 8.0),
      //       Text(
      //         description,
      //         style: const TextStyle(fontSize: 18.0),
      //       ),
      //     ],
      //   ),
      //   child: child,
      // ),
    );
  }
}
