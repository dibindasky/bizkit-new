// ignore_for_file: constant_identifier_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/routes/routes.dart';

export 'module/bizcard_constants.dart';
export 'module/task_constatnts.dart';
export 'module/attendence_constant.dart';

// dummy image for development
const dummyPersonImage = 'asset/images/person.jpeg';
const demoPerosnImgPeltandpell = 'asset/images/peltandpell_person_img_demo.png';
const dummyImg3 = 'asset/images/dummy_img3.png';
const personDemoImg = 'asset/images/person_img_demo.png';
const personImage = 'asset/images/camera select Icon.png';
const chatSectionPersonDummyImg1 = 'asset/images/chat_section_dummy_img1.png';
const chatSectionPersonDummyImg2 = 'asset/images/chat_section_dummy_img2.png';
const image =
    'https://firebasestorage.googleapis.com/v0/b/travelapp-c2e16.appspot.com/o/userprofile%2Ftest%2Fqr_dummy.jpg?alt=media&token=366b2bb2-6de0-4aa2-835e-1b1fc546f924';
const imageDummyNetwork =
    'https://lh5.googleusercontent.com/p/AF1QipPTbbL0IONA4Y6MLSe6cHV0n_MXWsJY-N1P9D4G=w426-h240-k-no';

void formatWebsiteUrl(String url, TextEditingController controller) {
  String formattedUrl = url.replaceAll(' ', '');
  formattedUrl = formattedUrl.toLowerCase();
  controller.text = formattedUrl;
}

String getBase64(String? base64) {
  if (base64 == null) return '';
  return base64.startsWith('data') ? base64.substring(22) : base64;
}

TextStyle fontPopins = const TextStyle(fontFamily: 'Poppins');

enum Validate {
  phone,
  mobOrLandline,
  email,
  password,
  none,
  rePassword,
  adminEmail,
  notNull,
  ifsc,
  upi,
  gst,
  website,
  ifValidnumber,
  ifValidWebsite,
  ifValidEmail,
  emailOrPhone,
}

/// modules enum
enum Module { card, task, attendance }

/// will return the enum string
String? getStringFromModule(Module? module) {
  switch (module) {
    case Module.card:
      return 'Card Module';
    case Module.task:
      return 'Task Module';
    case Module.attendance:
      return 'Attendance Module';
    default:
      return null;
  }
}

/// will return the [Module] form String
Module? getModuleFromString(String? moduleString) {
  switch (moduleString) {
    case 'Card Module':
      return Module.card;
    case 'Task Module':
      return Module.task;
    case 'Attendance Module':
      return Module.attendance;
    default:
      return null;
  }
}

String cardIconHomeBottomBar =
    'asset/images/NavPngs/—Pngtree—vector house icon_4013710.png';
String cardIconcardIcon = 'asset/images/NavPngs/my connection selected.png';
String iconHomeGreyBottomBar = 'asset/images/NavPngs/home_icon_grey.png';
String iconAccountBottomBar =
    'asset/images/NavPngs/account_circle_FILL1_wght400_GRAD0_opsz24.png';
String iconScannerBottombar = 'asset/images/NavPngs/selfie selected.png';
String iconModuleSelectorBottomBar = 'asset/images/NavPngs/module_chooser.png';
String iconTaskCalenderBottomBar = 'asset/images/task/task third tab.png';

BorderRadius kBorderRadius5 = BorderRadius.circular(5);
BorderRadius kBorderRadius10 = BorderRadius.circular(10);
BorderRadius kBorderRadius20 = const BorderRadius.all(Radius.circular(20));
BorderRadius kBorderRadius25 = const BorderRadius.all(Radius.circular(25));
BorderRadius kBorderRadius15 = const BorderRadius.all(Radius.circular(15));
final kHeight5 = SizedBox(height: 5.h);
final kHeight10 = SizedBox(height: 10.h);
final kHeight20 = SizedBox(height: 20.h);
final kHeight30 = SizedBox(height: 30.h);
final kHeight40 = SizedBox(height: 40.h);
final kHeight50 = SizedBox(height: 50.h);

final kWidth5 = SizedBox(width: 5.w);
final kWidth10 = SizedBox(width: 10.w);
final kWidth20 = SizedBox(width: 20.w);
final kWidth30 = SizedBox(width: 30.w);
final kWidth50 = SizedBox(width: 50.w);

TextStyle fontPopinsBold = fontPopins.copyWith(fontWeight: FontWeight.w700);
TextStyle fontPopinsRegular = fontPopins.copyWith(fontWeight: FontWeight.w400);
TextStyle fontPopinsMedium = fontPopins.copyWith(fontWeight: FontWeight.w500);
TextStyle fontPopinsThin = fontPopins.copyWith(fontWeight: FontWeight.w100);

const String mapMarker = 'asset/images/map marker.png';
const String taskOnbaordfirst = 'asset/images/task_onboard/task onboard 1.png';
const String taskOnbaordSecond =
    'asset/images/task_onboard/task onboard 2 .png';
const String taskOnbaordThird = 'asset/images/task_onboard/task onboard 3.png';

const onBoardScreenfirstpersonImages =
    'asset/images/onboarding/onboard image fisrt image.png';
const onBoardScreenSecond =
    'asset/images/onboarding/onboarding second card image.png';
const onBoardScreenThird =
    'asset/images/onboarding/onbaord third  connection image.png';

const errorMessage = 'Something went wrong please try again';
const empty = 'empty';
const bloodGroups = [
  'O+',
  'A+',
  'B+',
  'A-',
  'AB+',
  'B-',
  'O-',
  'AB-',
  "Don't know"
];

const socialMedia = [
  'Instagram',
  'LinkedIn',
  'Whatsapp',
  'Telegram',
  'Youtube',
  'Facebook',
  'X'
];

const socialMediaImage = {
  'Instagram': imageInstagram,
  'LinkedIn': imageLinkedIn,
  'Whatsapp': imageWhatsap,
  'Telegram': imageTelegram,
  'Youtube': imageYoutube,
  'Facebook': imageFaceBook,
  'X': imageX
};

//socoal media
const imageWhatsap = 'asset/images/watsapp account icon.png';
const imageX = 'asset/images/x account icon.png';
const imageLinkedIn = 'asset/images/linked in account  icon.png';
const imageFaceBook = 'asset/images/facebok account icon.png';
const imageInstagram = 'asset/images/instagram.jpeg';
const imageYoutube = 'asset/images/youtube.jpeg';
const imageTelegram = 'asset/images/telegram_png..png';

//gif card view
const imagePhone = 'asset/images/phone.png';
const imageSpinner = 'asset/images/social_media.png';
const gifMail = 'asset/images/letter.png';
const gifGlobe = 'asset/images/globe.png';
const gifLocation = 'asset/images/location.png';

const imageBanking = 'asset/images/banking.png';
const imagePerson = 'asset/images/persona.png';
const imageAchivement = 'asset/images/add_icon.png';

const imageBackgroundCard = 'asset/images/wp.jpg';
const imageDummyAsset = 'asset/images/previewimage5.jpeg';
const personProfile =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&usqp=CAU';
// icons
const iconConnectionPeople = 'asset/images/connection_icon.png';
const iconAddCircle = 'asset/images/add_icon.png';
const iconNotification = 'asset/images/notification_icon.png';
const iconBizkitPng = 'asset/images/bizkitIcon.png';
const iconAchivementsMedal = 'asset/images/achivements_medal.png';
const iconPersonOutline = 'asset/images/person_outline.png';
const iconBankingHouse = 'asset/images/bank_house.png';

// empty images
const emptyDataGif = 'asset/images/Reminders.gif';
// const emptyNodata2 = 'asset/images/404 Error Page not Found with people connecting a plug.gif';
// const emptyNodata3 = 'asset/images/File searching.gif';
// const emptyNodata4 = 'asset/images/Menstrual calendar-pana 1.png';
const emptyNodata1 = 'asset/images/Reminders-pana 1 (1).png';
const emptyNodata2 = 'asset/images/No data-pana 1.png';
const emptyNodata3 = 'asset/images/No data-amico 1.png';
const emptyNodata4 = 'asset/images/Menstrual calendar-pana 1.png';

//getting base64 String value based on format
String getBase64Image(String format, String? base64String) {
  switch (format) {
    case 'jpeg':
      base64String =
          base64String?.replaceFirst(RegExp(r'data:image/jpeg;base64,'), '');
      log('JPEG format detected. $base64String');
      break;
    case 'jpg':
      base64String =
          base64String?.replaceFirst(RegExp(r'data:image/jpg;base64,'), '');

      break;
    case 'png':
      base64String =
          base64String?.replaceFirst(RegExp(r'data:image/png;base64,'), '');
      log('PNG format detected. $base64String');
      break;
    case 'bmp':
      base64String =
          base64String?.replaceFirst(RegExp(r'data:image/bmp;base64,'), '');
      log('PNG format detected. $base64String');
      break;
    case 'gif':
      base64String =
          base64String?.replaceFirst(RegExp(r'data:image/gif;base64,'), '');
      log('PNG format detected.');
      break;
    // Add cases for other formats if needed
    default:
      log('Unsupported format detected.');
      break;
  }
  return '';
}

String getImageFormat(String? base64String) {
  if (base64String == null) return '';
  final formats = ['jpeg', 'png', 'gif', 'bmp', 'jpg'];
  for (final format in formats) {
    if (base64String.startsWith('data:image/$format;base64,')) {
      return format;
    }
  }
  return '';
}

//Show case asset images
const String rightArrowShocaseBorderImage =
    'asset/images/showcase images/right arrow showcase box.png';
const String leftArrowShocaseBorderImage =
    'asset/images/showcase images/left_arrow_shacase box.png';
const String profileCompletionScreen =
    'asset/images/showcase images/profile-completion.png';
const String reminders = 'asset/images/showcase images/reminders here.png';
const String scaanner = 'asset/images/showcase images/scanner.png';
const String connections = 'asset/images/showcase images/Coneections.png';

//Show case texts
const String profileCompletionText = 'Profile completion text';
const String connectionText = 'Connection text';
const String reminderText = 'reminder text';
const String scannerText = 'Scanner text';
const String newConnnectionText = 'New connection text';
const String levelSettingText = 'Level setting text';

commenText(String data, {TextStyle? style}) {
  return Text(data, style: style);
}

List<String> names = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Hannah',
  'Isaac',
  'Jack',
];

String maskEmail(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex <= 3) {
    return email;
  }

  String username = email.substring(0, atIndex);
  String domain = email.substring(atIndex);

  String maskedUsername =
      username.substring(0, 3) + '*' * (username.length - 3);

  return maskedUsername + domain;
}

List<void Function()> myTeamActivitiesOnTaps = [
  () {
    Get.toNamed(Routes.attendenceMsTeamTimeSheet, id: 22);
  },
  () {
    Get.toNamed(Routes.attendenceMSLeaveAndRequests, id: 22);
  },
  () {
    Get.toNamed(Routes.attendenceMsCalendar, id: 22);
  },
  () {
    Get.toNamed(Routes.attendenceMsPeltAndPell, id: 22);
  },
];

String bizcardIconBase64 =
    'data:image/png;base64,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';

String imageTestingBase64 =
   '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';
