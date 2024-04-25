import 'dart:developer';

import 'package:flutter/material.dart';

void formatWebsiteUrl(String url, TextEditingController controller) {
  String formattedUrl = url.replaceAll(' ', '');
  formattedUrl = formattedUrl.toLowerCase();
  controller.text = formattedUrl;
}

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

const pdfImage = 'asset/images/pdf iamge.png';

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
  imageHistoryLog4
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

// images = images.replaceFirst(
//                                       RegExp(r'data:image/jpg;base64,'), '');
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
