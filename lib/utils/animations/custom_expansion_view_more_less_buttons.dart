import 'package:flutter/material.dart';

class ExpandableViewMoreViewLessContainer extends StatefulWidget {
  final Widget child;
  final double collapsedHeight;
  final String viewMoreText;
  final String viewLessText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;

  const ExpandableViewMoreViewLessContainer({
    Key? key,
    required this.child,
    this.collapsedHeight = 200, // Default collapsed height
    this.viewMoreText = 'View More',
    this.viewLessText = 'View Less',
    this.buttonTextStyle,
    this.buttonColor,
  }) : super(key: key);

  @override
  State<ExpandableViewMoreViewLessContainer> createState() => _ExpandableViewMoreViewLessContainerState();
}

class _ExpandableViewMoreViewLessContainerState extends State<ExpandableViewMoreViewLessContainer> {
  bool isExpanded = false;
  late GlobalKey _contentKey;
  double? contentHeight;

  @override
  void initState() {
    super.initState();
    _contentKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureContentHeight();
    });
  }

  void _measureContentHeight() {
    final RenderBox? contentBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (contentBox != null) {
      setState(() {
        contentHeight = contentBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // If content height is not yet measured or less than collapsed height,
    // just show the content without buttons
    if (contentHeight == null || contentHeight! <= widget.collapsedHeight) {
      return Container(
        key: _contentKey,
        child: widget.child,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? contentHeight : widget.collapsedHeight,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              key: _contentKey,
              child: widget.child,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildExpandButton(context),
      ],
    );
  }

  Widget _buildExpandButton(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: widget.buttonColor ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
        );

    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isExpanded ? widget.viewLessText : widget.viewMoreText,
            style: widget.buttonTextStyle ?? defaultStyle,
          ),
          const SizedBox(width: 4),
          Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: widget.buttonColor ?? Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
