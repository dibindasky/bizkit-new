import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class SelfiePreviewScreen extends StatelessWidget {
  const SelfiePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: kwidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            adjustHieght(khieght * 0.10),
            Text(
              'Selfie',
              style:
                  TextStyle(fontSize: kwidth * 0.08, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text('Skip',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: kwhite,
                    fontSize: kwidth * 0.06,
                    fontWeight: FontWeight.w300)),
            adjustHieght(khieght * 0.05),
            Container(
              padding: const EdgeInsets.all(35),
              width: kwidth * 0.28,
              height: kwidth * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(kwidth * 0.2)),
                image: const DecorationImage(
                  image: AssetImage('asset/images/cameraSelectBackground.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: PhysicalModel(
                color: kwhite,
                elevation: 8.0,
                shadowColor: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.5),
                borderRadius: BorderRadius.circular(50.0),
                child: const CircleAvatar(
                  backgroundColor: kwhite,
                ),
              ),
            ),
            adjustHieght(khieght * 0.05),
          ],
        ),
      ),
    );
  }
}
