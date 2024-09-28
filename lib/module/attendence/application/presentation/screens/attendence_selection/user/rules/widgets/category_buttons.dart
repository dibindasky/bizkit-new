import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryButton('General', neonShadeLinearGradient),
          adjustWidth(10.w),
          _buildCategoryButton(
              'Employee',
              const LinearGradient(
                colors: [lightColr, lightColr],
              )),
          adjustWidth(10.w),
          _buildCategoryButton(
              'Leave Policy',
              const LinearGradient(
                colors: [lightColr, lightColr],
              )),
          adjustWidth(10.w),
          _buildCategoryButton(
              'Deductions',
              const LinearGradient(
                colors: [lightColr, lightColr],
              )),
          adjustWidth(10.w),
          _buildCategoryButton(
              'Leave Policy',
              const LinearGradient(
                colors: [lightColr, lightColr],
              )),
          adjustWidth(10.w),
          _buildCategoryButton(
              'Deductions',
              const LinearGradient(
                colors: [lightColr, lightColr],
              )),
          adjustWidth(10.w),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String text, Gradient gradient) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: kBorderRadius10,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: textThinStyle1.copyWith(color: kwhite),
          ),
        ),
      ),
    );
  }
}
