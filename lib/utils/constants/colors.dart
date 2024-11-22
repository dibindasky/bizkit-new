import 'dart:developer';

import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color koffWhite = Color.fromARGB(255, 245, 247, 250);
const Color kblack = Colors.black;
const Color kGreyDark = Color.fromARGB(255, 19, 19, 20);
const Color kneon = Color.fromARGB(255, 25, 255, 221);
const Color kneonDark = Color.fromARGB(255, 6, 199, 172);
const Color kblue = Colors.blue;
const Color kgrey = Color.fromARGB(255, 117, 115, 115);
const Color kred = Color.fromARGB(255, 255, 0, 0);
const Color kDarkRed = Color.fromARGB(255, 207, 1, 1);
const Color kGrayLight = Color.fromARGB(255, 216, 216, 214);
const Color kGreyNormal = Colors.grey;
const Color klightgrey = Color.fromARGB(223, 231, 231, 233);
const Color smallBigGrey = Color.fromRGBO(255, 255, 255, 0.162);
// ---------------------------------------------------------

const Color textFieldFillColr = Colors.white;

const Color bottomsheetContainerclr = Color.fromRGBO(49, 49, 49, 1);

const Color kNotificationColor = Color(0xFF333333);
const Color kwhite = Colors.white;
const Color kgreen = Colors.green;
const Color kyellow = Color(0xFFFFCE30);
const Color klightGrey = Color(0xFFF5F5F5);
const Color neonShade = Color.fromRGBO(6, 199, 172, 1);
const Color kneonShade = Color.fromRGBO(1, 253, 220, 1);
const Color klightred = Color(0xFFFFECEF);
const Color kneonShade2 = Color.fromRGBO(25, 255, 221, 1);
const Color knill = Colors.transparent;
const Color backgroundColour = Color.fromRGBO(41, 41, 41, 1);
const Color lightColr = Color.fromRGBO(53, 53, 53, .42);
Color lightGrey = Colors.grey[800] ?? Colors.grey;
const Color kOrange = Color.fromARGB(255, 201, 121, 2);
const klightGreyClr = Color(0xFF313131);
const Color holidayBorderClr = Color(0xFF5E77FF);
const Color leaveBorderClr = Color(0xFFFF814C);
const klightDarkGrey = Color.fromARGB(255, 40, 40, 40);
double khieght = 850;
double kwidth = 400;

// SizedBox kempty = const SizedBox(height: 0);
// void sizeFinder(BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   print(size.height);
//   print(size.width);
//   khieght = size.height > 900 ? 900 : size.height;
//   kwidth = size.width > 450 ? 450 : size.width;
// }

adjustWidth(double width) {
  return SizedBox(width: width);
}

adjustHieght(double height) {
  return SizedBox(height: height);
}

const String fontPoppins = 'Poppins';
const String fontEuclid = 'Euclid';

TextStyle textHeadStyle1 = TextStyle(
  color: kwhite,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
);

TextStyle textStyle1 = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w400,
);

TextStyle textThinStyle1 = TextStyle(
  fontSize: 13.sp,
  fontWeight: FontWeight.w200,
);
TextStyle textThinerStyle1 = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w200,
);

LinearGradient neonShadeGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(6, 199, 172, 1),
    Color.fromRGBO(17, 129, 114, 1),
    Color.fromRGBO(6, 199, 172, .34),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient neonNewLinearGradient = const LinearGradient(
  colors: [
    Color(0xFF59FBFB),
    Color(0xFF379D98),
    Color(0xFF59F6FB),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

LinearGradient neonShadeLinearGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(5, 202, 173, 1),
    Color.fromRGBO(43, 89, 115, 1),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient neonShadeGradientTopToBottom = const LinearGradient(
  colors: [
    Color.fromRGBO(1, 214, 186, 1),
    Color.fromRGBO(2, 167, 145, 1),
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
    Color.fromRGBO(1, 44, 38, 1),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomRight,
);

LinearGradient whiteShadeGradient = const LinearGradient(
  colors: [
    Color.fromRGBO(243, 243, 243, 1),
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
  fontSize: 14.sp,
);

// Task module - [ Method for spotlight color changing ]
Color taskSpotLightColorChanger(String? date1, String? date2) {
  if (date1 == null || date2 == null) {
    log('Invalid date(s): date1=$date1, date2=$date2', name: 'TaskContainer');
    return kwhite;
  }

  try {
    final int first = DateTimeFormater.calculateDifferenceInHours(date1, date2);
    final int second = DateTimeFormater.calculateDifferenceInHours(
        date1, DateTime.now().toString());

    if (first < second) return kred;
    final int part = (first / 3).round();
    if ((part * 2) <= second) {
      return leaveBorderClr;
    } else if (part <= second) {
      return neonShade;
    } else {
      return kblue;
    }
  } catch (e) {
    log('Error calculating difference in hours: $e', name: 'TaskContainer');
    return kwhite;
  }
}

Color recentTaskColorChanger(String? date1, String? date2) {
  if (date1 == null || date2 == null) {
    log('Invalid date(s): date1=$date1, date2=$date2', name: 'TaskContainer');
    return kwhite;
  }

  try {
    final int first = DateTimeFormater.calculateDifferenceInHours(date1, date2);
    final int second = DateTimeFormater.calculateDifferenceInHours(
        date1, DateTime.now().toString());

    if (first < second) return kred;
    final int part = (first / 3).round();
    if ((part * 2) <= second) {
      return leaveBorderClr;
    } else if (part <= second) {
      return neonShade;
    } else {
      return kblue;
    }
  } catch (e) {
    log('Error calculating difference in hours: $e', name: 'TaskContainer');
    return kwhite;
  }
}
