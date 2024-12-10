import 'package:animate_do/animate_do.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/custom_paints/bottom_bar_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomBar extends StatelessWidget {
  final List<String> imageAssets;
  final int selectedIndex;
  final Function(int) onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final List<double>? imageSizes;
  final double height;

  const CustomBottomBar({
    Key? key,
    required this.imageAssets,
    required this.selectedIndex,
    required this.onTap,
    this.selectedColor = kneonDark,
    this.unselectedColor = kGreyDark,
    this.imageSizes,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: BoxDecoration(
        color: knill,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, -7),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Custom curved shape
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, height.h),
            painter: BottomBarPainter(),
          ),
          // Navigation items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              imageAssets.length,
              (index) => GestureDetector(
                onTap: () => onTap(index),
                child: selectedIndex == index
                    ? ElasticIn(
                        animate: true,
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.asset(
                              imageAssets[index],
                              // width: imageSize.h,
                              height: imageSizes?[index] ?? (height.h / 2),
                              color: selectedIndex == index
                                  ? selectedColor
                                  : unselectedColor,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            imageAssets[index],
                            // width: imageSize.h,
                            height: imageSizes?[index] ?? (height.h / 2),
                            color: selectedIndex == index
                                ? selectedColor
                                : unselectedColor,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
