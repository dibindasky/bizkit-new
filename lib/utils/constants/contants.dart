// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/routes/routes.dart';

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

enum TaskType { official, personal, others }

enum PriorityLevel { medium, low, high }

enum FilterTypes { all, self_to_self, self_to_others, others_to_self }

enum RecurringTimePeriod { everyDay, everyWeek, everyMoth, custom, none }

enum Module { card, task, attendance }

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
const achivementEvents = ['Award', 'Certificate', 'Accolade', 'Accreditation'];
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

// history log images bizcard
const imageHistoryList = [
  imageHistoryLog1,
  imageHistoryLog2,
  imageHistoryLog3,
  imageHistoryLog4,
];
const imageHistoryLog1 = 'asset/images/meeting profile png1.png';
const imageHistoryLog2 = 'asset/images/meeting profile png2.png';
const imageHistoryLog3 = 'asset/images/meeting profile png3.png';
const imageHistoryLog4 = 'asset/images/meeting profile png4.png';

// empty images
// const emptyNodata1 = 'asset/images/Reminders.gif';
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

//Task Constatnts
TextStyle fontPopinsBold = fontPopins.copyWith(fontWeight: FontWeight.w700);
TextStyle fontPopinsRegular = fontPopins.copyWith(fontWeight: FontWeight.w400);
TextStyle fontPopinsMedium = fontPopins.copyWith(fontWeight: FontWeight.w500);
TextStyle fontPopinsThin = fontPopins.copyWith(fontWeight: FontWeight.w100);

const String taskFolderImage = 'asset/images/task/folder Image.png';
const String taskFolderLongPressMergeImage =
    'asset/images/task/foldeSelecting Merge Icon.png';
const String taskFolderLongPressSelectAllImage =
    'asset/images/task/folder all selecting.png';
const String taskHomeNNOtificationAsset =
    'asset/images/icon/image 4 (Traced).png';

const String taskHomeSelfieIconImage = 'asset/images/task/selfie.png';
const String taskHomeToMeIconImage = 'asset/images/task/to_me.png';
const String taskHomeToOthersIconImage = 'asset/images/task/to_others.png';

const String taskTimeIconImage = 'asset/images/task/task_time_icon.png';
const String taskExpenseIconImage = 'asset/images/task/task_expense_icon.png';

final List<Map<String, String>> tasks = [
  {
    'title': 'Edit a Picture',
    'description':
        'Image editing encompasses the processes of altering images, whether they are digital photographs, traditional photo-chemical photographs, or illustrations. Traditional analog image editing is known as photo retouching, using tools such as an airbrush to modify photographs or editing illustrations with any traditional art medium.',
    'date': 'Feb, 21 - Mar, 27',
    'color': '0xFFFF6006',
    'percentage': '70',
  },
  {
    'title': 'New Project User Flow',
    'description':
        'User interface (UI) design is the process designers use to build interfaces in software or computerized devices, focusing on looks or style. Designers aim to create interfaces which users find easy to use and pleasurable. UI design refers to graphical user interfaces and other forms e.g., voice-controlled interfaces.',
    'date': 'Feb, 21 - Mar, 12',
    'color': '0xFF0B06FF',
    'percentage': '67'
  },
  {
    'title': 'Laravel Task',
    'description':
        'Laravel is a web application framework with expressive, elegant syntax. Web development must be an enjoyable and creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication.',
    'date': 'Feb, 21 - Mar, 22',
    'color': '0xFF06FFD2',
    'percentage': '40'
  },
  {
    'title': 'Edit a Picture',
    'description':
        'Image editing encompasses the processes of altering images, whether they are digital photographs, traditional photo-chemical photographs, or illustrations. Traditional analog image editing is known as photo retouching, using tools such as an airbrush to modify photographs or editing illustrations with any traditional art medium.',
    'date': 'Feb, 21 - Mar, 27',
    'color': '0xFFFF6006',
    'percentage': '100'
  },
];

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

// Attendence Module Assets

const String attendenceSolidPdfImg = 'asset/images/fa-solid_file-pdf.png';
const String attendenceMedicalBillImg = 'asset/images/medical_bill_img.png';

// => Onborading Images
const String attendenceOnboardingFirstImg =
    'asset/images/attendence onboarding/attendence_onboard 1.png';
const String attendenceOnboardingSecondImg =
    'asset/images/attendence onboarding/attendence_onboard 2.png';

// => Home Screen
const String attendenceClockInBtn =
    'asset/images/attendence module/home screen btns/clockIn_btn.png';
const String attendenceBreakBtn =
    'asset/images/attendence module/home screen btns/break_btn.png';
const String attendenceLeaveBtn =
    'asset/images/attendence module/home screen btns/leave_btn.png';
const String attendenceClockOutBtn =
    'asset/images/attendence module/home screen btns/clockout_btn.png';

// =>  Home screen Dialogs
const String clockInLocationDialogimg =
    'asset/images/attendence module/home screen dialogs/location_img.png';
const String clockInOutsideDialogimg =
    'asset/images/attendence module/home screen dialogs/outside.png';
const String clockInTimeManagementDialogimg =
    'asset/images/attendence module/home screen dialogs/Time management-img.png';
const String clockInSuccessDialogimg =
    'asset/images/attendence module/home screen dialogs/clockIn_success_ig.png';
const String takeBreakDialogimg =
    'asset/images/attendence module/home screen dialogs/coffee_break_img.png';

// => Home screen Clocks

const String clockImg =
    'asset/images/attendence module/home screen clocks/clock.png';
const String afternoonClockImg =
    'asset/images/attendence module/home screen clocks/afternoon.png';
const String countDownClockImg =
    'asset/images/attendence module/home screen clocks/countdown.png';

// Attendence Selection Grid Images
const String timesheetImg =
    'asset/images/attendence module/attendence secetion/timesheet_img.png';
const String teamTimeSheetImg =
    'asset/images/attendence module/attendence secetion/teamtimeSheet_img.png';
const String rulesImg =
    'asset/images/attendence module/attendence secetion/rules_img.png';
const String peltAndPellImg =
    'asset/images/attendence module/attendence secetion/pelt&pell_img.png';
const String leavesImg =
    'asset/images/attendence module/attendence secetion/leaves_img.png';
const String calendarImg =
    'asset/images/attendence module/attendence secetion/calendar_img.png';
const String reportImg =
    'asset/images/attendence module/attendence secetion/report_img.png';

// => Attendence selection screen- userside

const List<String> imageUrls = [
  timesheetImg,
  leavesImg,
  rulesImg,
  teamTimeSheetImg,
  reportImg,
  calendarImg,
  peltAndPellImg,
];

const List<String> titles = [
  'Timesheet',
  'Leaves',
  'Rules',
  'Team Timesheet',
  'Report',
  'Calendar',
  'PELT&PELL',
];

List<void Function()> onTaps = [
  () {
    Get.toNamed(Routes.attendenceTimeSheet, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceLeaves, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceRules, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceTeamTimeSheet, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceReport, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceCalender, id: 2);
  },
  () {
    Get.toNamed(Routes.attendencePeltAndPell, id: 2);
  },
];

// => Attendence Leaves screen

const List<String> leavesGridTitles = [
  'Leave Balance',
  'Leave Pendings',
  'Leave Approved',
  'Leave Rejected'
];
const List<String> leavesGridSubTitles = ['10', '2', '3', '1'];

// ================ My Team Activities Tab GridView - Management Side ================

const List<String> myTeamActivitiesImageUrls = [
  teamTimeSheetImg,
  leavesImg,
  calendarImg,
  peltAndPellImg,
];
const List<String> myTeamActivitiesTitles = [
  'Team Timesheet',
  'Leaves & Requests',
  'Calendar',
  'PELT&PELL'
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
    Get.toNamed(Routes.attendenceMsTeamTimeSheet, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceMSLeaveAndRequests, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceMsCalendar, id: 2);
  },
  () {
    Get.toNamed(Routes.attendenceMsPeltAndPell, id: 2);
  },
];

// ================ My Activities Tab GridView - Management Side ================

const List<String> myActivitiesImageUrls = [
  timesheetImg,
  leavesImg,
  rulesImg,
  reportImg,
  calendarImg,
  peltAndPellImg,
];
const List<String> myActivitiesTitles = [
  'Timesheet',
  'Leaves',
  'Rules',
  'Reports',
  'Calendar',
  'PELT&PELL',
];
List<void Function()> myActivitiesOnTaps = [
  () {
    log("Timesheet");
  },
  () {
    log('Leaves');
  },
  () {
    log('Rules');
  },
  () {
    log('Reports');
  },
  () {
    log('Calendar');
  },
  () {
    log('PELT&PELL');
  },
];

String imageTestingBase64 =
    'data:image/png;base64,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';
