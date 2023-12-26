import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/selfie_card/view/widgets/selfie_preview_screen.dart';
import 'package:flutter/material.dart';

class SelfieScreen extends StatelessWidget {
  const SelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: kwidth,
        child: Column(
          children: [
            adjustHieght(khieght * 0.10),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: kwidth * 0.080,
                  backgroundColor: textFieldFillColr,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('asset/images/bizkitIcon.png'),
                  ),
                ),
              ),
            ),
            adjustHieght(khieght * 0.05),
            Container(
              width: kwidth * 0.80,
              height: kwidth * 0.60,
              color: kwhite,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                scannerButton(image: 'asset/images/camerFromgalleryIcon.png'),
                InkWell(
                  splashColor: neonShade,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelfiePreviewScreen(),
                      ),
                    );
                  },
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(35),
                    width: kwidth * 0.28,
                    height: kwidth * 0.28,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kwidth * 0.2)),
                        image: const DecorationImage(
                          image: AssetImage(
                              'asset/images/cameraSelectBackground.png'),
                          fit: BoxFit.contain,
                        )),
                    child: Image.asset(
                      'asset/images/camera select Icon.png',
                    ),
                  ),
                ),
                scannerButton(image: 'asset/images/ic_twotone-tap-and-play.png')
              ],
            ),
            adjustHieght(khieght * 0.05)
          ],
        ),
      ),
    );
  }

  Container scannerButton({required String image}) {
    return Container(
      width: kwidth * 0.13,
      height: kwidth * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kwidth * 0.1)),
        border: Border.all(
          color: neonShade,
          width: kwidth * 0.003,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(image),
      ),
    );
  }
}
