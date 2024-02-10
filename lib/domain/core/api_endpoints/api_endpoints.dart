class ApiEndPoints {
  static String baseUrl = 'http://192.168.152.241:8000';
  // static String baseUrl = 'http://44.212.19.127';

  static String refreshUrl = '/accounts/api/token/refresh/';
  static String login = '/accounts/login/';
  static String register = '/accounts/register/';
  static String sendOtpMail = '/verifications/send_verification_email/';
  static String verifyOtp = '/verifications/verify_email/';
  static String forgotPassword = '/verifications/forgot_password/';
  static String verifyforgotPassword = '/verifications/verify_forgot_password/';
  static String changePassword = '/verifications/change_password/';
  static String createCard = '/card/card/';
}
