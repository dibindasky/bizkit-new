import 'package:flutter/material.dart';

const Color textFieldFillColr = Color.fromRGBO(49, 49, 49, 0.5);
const Color smallBigGrey = Color.fromRGBO(255, 255, 255, 0.1);
const Color kGrayLight = Color.fromRGBO(73, 73, 73, 1);
const Color bottomsheetContainerclr = Color.fromRGBO(49, 49, 49, 1);
const Color klightgrey = Color.fromARGB(255, 169, 169, 169);
const Color kgrey = Color.fromARGB(255, 105, 105, 105);
const Color kwhite = Colors.white;
const Color kgreen = Colors.green;
const Color kred = Color.fromARGB(255, 255, 0, 0);
const Color kblue = Colors.blue;
const Color neonShade = Color.fromRGBO(6, 199, 172, 1);
const Color kneonShade = Color.fromRGBO(1, 253, 220, 1);
const Color kblack = Colors.black;
const Color knill = Colors.transparent;
const Color backgroundColour = Color.fromRGBO(41, 41, 41, 1);
const Color lightColr = Color.fromRGBO(53, 53, 53, .42);
Color lightGrey = Colors.grey[800] ?? Colors.grey;
const Color kOrange = Colors.orange;

double khieght = 850;
double kwidth = 400;

SizedBox kempty = const SizedBox(height: 0);
// void sizeFinder(BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   print(size.height);
//   print(size.width);
//   khieght = size.height > 900 ? 900 : size.height;
//   kwidth = size.width > 450 ? 450 : size.width;
// }

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
  fontSize: kwidth * 0.04,
  fontWeight: FontWeight.w700,
);

TextStyle textStyle1 = TextStyle(
  fontSize: kwidth * 0.035,
  fontWeight: FontWeight.w400,
);

LinearGradient neonShadeGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(6, 199, 172, 1),
    Color.fromRGBO(6, 199, 172, 1),
    Color.fromRGBO(6, 199, 172, .34),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
LinearGradient neonShadeGradientTopToBottom = const LinearGradient(
  colors: [
    Color.fromRGBO(6, 199, 172, .34),
    Color.fromRGBO(6, 199, 172, .34),
    Color.fromRGBO(8, 136, 119, 1),
    Color.fromRGBO(6, 199, 172, 1),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomRight,
);
LinearGradient blackShadeGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(0, 0, 0, 1),
    Color.fromRGBO(33, 39, 38, 1),
    Color.fromRGBO(1, 31, 27, 1),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomRight,
);
LinearGradient whiteShadeGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(220, 221, 221, 1),
    Color.fromRGBO(228, 227, 227, 1),
    Color.fromRGBO(214, 213, 213, 1),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

TextStyle custumText({
  FontWeight? fontWeight,
  double? fontSize,
  Color? colr,
  String? fontFamily,
}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'Euclid',
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: colr,
  );
}

TextStyle appBarHeading1 = TextStyle(
  color: kwhite,
  fontSize: kwidth * 0.042,
);
