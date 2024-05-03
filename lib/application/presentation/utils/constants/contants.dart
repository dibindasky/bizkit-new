import 'dart:developer';

import 'package:flutter/material.dart';

void formatWebsiteUrl(String url, TextEditingController controller) {
  String formattedUrl = url.replaceAll(' ', '');
  formattedUrl = formattedUrl.toLowerCase();
  controller.text = formattedUrl;
}

String getBase64(String? base64) {
  if (base64 == null) return '';
  return base64.startsWith('data') ? base64.substring(22) : base64;
}

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

const pdfImage =
    'data:image/png;base64,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';

//socoal media
const imageWhatsap = 'asset/images/watsapp account icon.png';
const imageX = 'asset/images/x account icon.png';
const imageLinkedIn = 'asset/images/linked in account  icon.png';
const imageFaceBook = 'asset/images/facebok account icon.png';
const imageInstagram = 'asset/images/instagram.jpeg';
const imageYoutube = 'asset/images/youtube.jpeg';
const imageTelegram = 'asset/images/telegram_png..png';

//gif card view
// const imagePhone = 'asset/images/preview phone.png';
// const imageSpinner = 'asset/images/preview_spinner.png';
// const gifMail = 'asset/images/preview messages gif.gif';
// const gifGlobe = 'asset/images/preview globe.gif';
// const gifLocation = 'asset/images/preview location gif.gif';
const imagePhone = 'asset/images/phone.png';
const imageSpinner = 'asset/images/social_media.png';
const gifMail = 'asset/images/letter.png';
const gifGlobe = 'asset/images/globe.png';
const gifLocation = 'asset/images/location.png';

const imageBanking = 'asset/images/banking.png';
const imagePerson = 'asset/images/persona.png';
const imageAchivement = 'asset/images/add_icon.png';

const imageBackgroundCard = 'asset/images/previewImage2.jpeg';
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

// history log images
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

// dummy image for development
const dummyPersonImage = 'asset/images/person.jpeg';
const personImage = 'asset/images/camera select Icon.png';
const image =
    'https://firebasestorage.googleapis.com/v0/b/travelapp-c2e16.appspot.com/o/userprofile%2Ftest%2Fqr_dummy.jpg?alt=media&token=366b2bb2-6de0-4aa2-835e-1b1fc546f924';
const imageDummyNetwork =
    'https://lh5.googleusercontent.com/p/AF1QipPTbbL0IONA4Y6MLSe6cHV0n_MXWsJY-N1P9D4G=w426-h240-k-no';

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

//Show cse asset images
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
