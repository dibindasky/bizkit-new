import 'package:animate_do/animate_do.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ScrollToTopButtonState createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.offset > 300 && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
    } else if (widget.scrollController.offset <= 300 && _isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Padding(
            padding: const EdgeInsets.only(bottom: 65, right: 10),
            child: FadeInUp(
              animate: true,
              child: GestureDetector(
                onTap: _scrollToTop,
                child: CircleAvatar(
                  backgroundColor: kneon,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      backgroundColor: kblack,
                      child: Icon(
                        Iconsax.arrow_up_3,
                        color: kwhite,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : kempty;
  }
}
