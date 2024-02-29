class ApiEndPoints {
  // static String baseUrl = 'http://192.168.152.241:8000';
  // static String baseUrl = 'http://192.168.29.216:8000';
  // static String baseUrl = 'http://44.212.19.127';
  static String baseUrl = 'https://bizkit.zikrabyte.in';

  static String refreshUrl = '/accounts/api/token/refresh/';
  static String login = '/accounts/login/';
  static String register = '/accounts/register/';
  static String sendOtpMail = '/verification/send_verification_email/';
  static String verifyOtp = '/verification/verify_email/';
  static String forgotPassword = '/verifications/forgot_password/';
  static String verifyforgotPassword = '/verifications/verify_forgot_password/';
  static String changePassword = '/verifications/change_password/';
  static String createCard = '/card/create-card/';
  static String createCardPersonal = '/card/personal-details/';
  static String createCardBusiness = '/card/business-details/';
  static String createCardBAnking = '/card/bank_details/';
  static String card = '/card/card-list/';
  static String deleteArchiveCard = '/card/get-card/{card_id}/';
  static String defaultCard = '/card/is_default/{card_id}/';
  static String contacts = '/card/registered_contacts/';
  static String getCompanies = '/accounts/companies/';
  static String getCompanyDetails = '/card/company-details/{company_id}/';
  static String getBusinessCategory = '/card/business_category/';
  static String getQr = '/level/list-qr/';
  static String levelsharingEdit = '/level/level-sharing-update/{level_sharing_id}/';
  static String getCardByUserId = '/card/card_of_another_user/{user_id}/';
  static String getCardByCardId = '/card/get-card/{card_id}/';
}
