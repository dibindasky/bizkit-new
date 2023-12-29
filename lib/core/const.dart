import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color textFieldFillColr = Color.fromRGBO(49, 49, 49, 0.5);
const Color smallBigGrey = Color.fromRGBO(255, 255, 255, 0.1);
const Color bottomsheetContainerclr = Color.fromRGBO(49, 49, 49, 1);
const Color klightgrey = Color.fromARGB(255, 169, 169, 169);
const Color kwhite = Colors.white;
const Color kgreen = Colors.green;
const Color kblue = Colors.blue;
const Color neonShade = Color.fromRGBO(6, 199, 172, 1);
const Color kblack = Colors.black;
const Color knill = Colors.transparent;
late double khieght;
late double kwidth;
const Color backgroundColour = Color.fromRGBO(27, 27, 27, 1);

adjustWidth(double width) {
  return SizedBox(
    width: width,
  );
}

adjustHieght(double height) {
  return SizedBox(
    height: height,
  );
}

TextStyle textHeadStyle1 = TextStyle(
  color: kwhite,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
);

TextStyle textStyle1 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
