import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/copy_clipboard/copy_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewScreenRowIconsModelSheet extends StatelessWidget {
  const PreviewScreenRowIconsModelSheet({
    super.key,
    required this.fromPreview,
    required this.image,
    this.items,
  });

  final List<String>? items;
  final bool fromPreview;
  final String image;

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
            child: items == null || items!.isEmpty
                ? const Center(
                    child: Text('Nothing to show'),
                  )
                : ListView.builder(
                    itemCount: items!.length,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(items![index]),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => copyToClipboard(
                                    text: items![index], context: context),
                                icon: const Icon(Icons.copy, color: neonShade)),
                            adjustWidth(kwidth * .04),
                            InkWell(
                              onTap: () => copyToClipboard(
                                  text: items![index], context: context),
                              child: CircleAvatar(
                                backgroundColor: textFieldFillColr,
                                // radius: 10,
                                backgroundImage: AssetImage(image),
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
