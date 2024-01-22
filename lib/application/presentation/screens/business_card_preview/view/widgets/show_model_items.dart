import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/copy_clipboard/copy_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewScreenRowIconsModelSheetItems extends StatelessWidget {
  const PreviewScreenRowIconsModelSheetItems({
    super.key,
    required this.isPhone,
    this.items,
  });

  final List<String>? items;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColour,
      ),
      child: ListView(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 5.dm,
              width: 85,
            ),
          ),
          adjustHieght(khieght * .03),
          SizedBox(
            height: 270,
            child: ListView.builder(
              itemCount: items?.length ?? 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(53, 53, 53, 0.42),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      adjustWidth(kwidth * .03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(isPhone ? 'Mobile number' : 'Facebook'),
                          Text(isPhone
                              ? '+91 0000 0000 00'
                              : 'www.facebook.com/....'),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => copyToClipboard(
                            text: '+91 000000000', context: context),
                        child: const CircleAvatar(
                          backgroundColor: textFieldFillColr,
                          radius: 10,
                          backgroundImage:
                              AssetImage('asset/images/copy number image.png'),
                        ),
                      ),
                      adjustWidth(kwidth * .08),
                      CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        radius: 10,
                        backgroundImage: AssetImage(
                          isPhone
                              ? 'asset/images/phone image.png'
                              : 'asset/images/accoutn share_icon copy.png',
                        ),
                      ),
                      adjustWidth(kwidth * .04),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
