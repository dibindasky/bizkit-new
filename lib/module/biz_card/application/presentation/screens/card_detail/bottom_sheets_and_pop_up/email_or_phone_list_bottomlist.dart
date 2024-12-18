import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/copy_clipboard/copy_clipboard.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: SizedBox(
        height: 270,
        child: widget.items == null || widget.items!.isEmpty
            ? Center(
                child: Text('Nothing to show',
                    style: Theme.of(context).textTheme.bodyMedium))
            : ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: widget.items!.length,
                itemBuilder: (context, index) {
                  final data = widget.items![index];
                  final dataHead = widget.itemsHeading![index];
                  return Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataHead,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                adjustHieght(5),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  data,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                copyToClipboard(text: data, context: context),
                            icon: Icon(
                              Icons.copy,
                              color: Theme.of(context).colorScheme.onPrimary,
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
    );
  }
}
