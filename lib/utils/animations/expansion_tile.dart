import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget(
      {super.key,
      this.borderColor,
      this.whileTap,
      this.isBorder = true,
      this.isExpandable = true,
      this.children,
      this.expansionColor,
      required this.child});
  final List<Widget>? children;
  final Widget child;
  final bool isExpandable;
  final bool isBorder;
  final Color? expansionColor;
  final Function(bool)? whileTap;
  final Color? borderColor;

  @override
  State<CustomExpansionTileWidget> createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // final themeController = Get.find<ThemeController>();
    return Container(
      decoration: !widget.isBorder
          ? null
          : BoxDecoration(
              color: widget.expansionColor != null && isExpanded
                  ? widget.expansionColor
                  : null,
              border: isExpanded
                  ? Border.all(color: widget.borderColor ?? kneon)
                  : null,
              borderRadius: kBorderRadius10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (widget.isExpandable) {
                  isExpanded = !isExpanded;
                }
                if (widget.whileTap != null) {
                  widget.whileTap!(isExpanded);
                }
              });
            },
            splashFactory: NoSplash.splashFactory,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              // padding: EdgeInsets.symmetric(vertical: 5.h),
              child: widget.child,
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: kempty,
            secondChild: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: widget.children != null ? 5.h : 0.h),
              child: widget.children != null
                  ? Column(
                      children: widget.children!,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
