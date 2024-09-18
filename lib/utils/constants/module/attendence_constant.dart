// Attendence Module Assets

import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:get/get.dart';

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
    Get.toNamed(Routes.attendenceTimeSheet, id: 22);
  },
  () {
    log('Leaves');
    Get.toNamed(Routes.attendenceLeaves, id: 22);
  },
  () {
    log('Rules');
    Get.toNamed(Routes.attendenceRules, id: 22);
  },
  () {
    log('Reports');
    Get.toNamed(Routes.attendenceReport, id: 22);
  },
  () {
    log('Calendar');
    Get.toNamed(Routes.attendenceCalender, id: 22);
  },
  () {
    log('PELT&PELL');
    Get.toNamed(Routes.attendencePeltAndPell, id: 22);
  },
];
