import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/copy_clipboard/copy_clipboard.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class PreviewScreenRowIconsModelSheet extends StatefulWidget {
  const PreviewScreenRowIconsModelSheet({
    super.key,
    required this.fromPreview,
    required this.image,
    this.itemsHeading,
    this.items,
  });

  final List<String>? items;
  final List<String>? itemsHeading;
  final bool fromPreview;
  final String image;

  @override
  State<PreviewScreenRowIconsModelSheet> createState() =>
      _PreviewScreenRowIconsModelSheetState();
}

class _PreviewScreenRowIconsModelSheetState
    extends State<PreviewScreenRowIconsModelSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 270,
            child: widget.items == null || widget.items!.isEmpty
                ? const Center(
                    child: Text('Nothing to show'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: widget.items!.length,
                    itemBuilder: (context, index) {
                      final data = widget.items![index];
                      final dataHead = widget.itemsHeading![index];
                      return Container(
                        height: 70,
                        decoration: const BoxDecoration(
                          color: textFieldFillColr,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            if (isValidEmail(data)) {
                              LaunchUrl.launchEmail(data);
                            } else if (isValidPhoneNumber(data)) {
                              LaunchUrl.launchCall(phone: data);
                            }
                          },
                          child: Row(
                            children: [
                              adjustWidth(kwidth * .03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataHead,
                                    style: const TextStyle(
                                        color: neonShade, fontSize: 10),
                                  ),
                                  adjustHieght(5),
                                  Text(
                                    data,
                                    style: const TextStyle(color: neonShade),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => copyToClipboard(
                                    text: data, context: context),
                                icon: const Icon(
                                  Icons.copy,
                                  color: neonShade,
                                ),
                              ),
                              adjustWidth(kwidth * .04),
                            ],
                          ),
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
