import 'dart:developer';
import 'package:flutter/material.dart';

// dummy image for development
const dummyPersonImage = 'asset/images/person.jpeg';
const personImage = 'asset/images/camera select Icon.png';
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

enum RecurringTimePeriod { everyDay, everyWeek, everyMoth, custom, none }

String iconHomeBottomBar =
    'asset/images/NavPngs/—Pngtree—vector house icon_4013710.png';
String iconHomeGreyBottomBar = 'asset/images/NavPngs/home_icon_grey.png';
String iconAccountBottomBar =
    'asset/images/NavPngs/account_circle_FILL1_wght400_GRAD0_opsz24.png';
String iconModuleSelectorBottomBar = 'asset/images/NavPngs/module_chooser.png';
String iconTaskCalenderBottomBar = 'asset/images/task/task third tab.png';

BorderRadius kBorderRadius5 = BorderRadius.circular(5);
BorderRadius kBorderRadius10 = BorderRadius.circular(10);
BorderRadius kBorderRadius20 = const BorderRadius.all(Radius.circular(20));
BorderRadius kBorderRadius25 = const BorderRadius.all(Radius.circular(25));
BorderRadius kBorderRadius15 = const BorderRadius.all(Radius.circular(15));
const kHeight5 = SizedBox(height: 5);
const kHeight10 = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kHeight30 = SizedBox(height: 30);
const kHeight40 = SizedBox(height: 40);
const kHeight50 = SizedBox(height: 50);

const kWidth5 = SizedBox(width: 5);
const kWidth10 = SizedBox(width: 10);
const kWidth20 = SizedBox(width: 20);
const kWidth30 = SizedBox(width: 30);
const kWidth50 = SizedBox(width: 50);

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

const String taskHomeNNOtificationAsset =
    'asset/images/icon/image 4 (Traced).png';

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
