class ApiEndPoints {
  //static String baseUrl = 'http://192.168.152.241:8000';
  //static String baseUrl = 'http://192.168.29.216:8000';
  //static String baseUrl = 'http://44.203.134.42';
  //static String baseUrl = 'https://bizkit.zikrabyte.in';

  static String baseUrl = 'http://192.168.29.217:8000';

// refesh token
  static String refreshUrl = '/accounts/api/token/refresh/';

// auth
  static String login = '/accounts/login/';
  static String register = '/accounts/register/';
  static String sendOtpMail = '/verification/send_verification_email/';
  static String verifyOtp = '/verification/verify_email/';
  static String forgotPassword = '/verification/forgot_password/';
  static String verifyforgotPassword = '/verification/verify_forgot_password/';
  static String forgottPassword = '/verification/change_password/';
  static String forgottPasswordProfile = '/accounts/password_change/';

// card
  static String createCard = '/card/create-card/';
  static String card = '/card/card-list/';
  static String deleteCard = '/card/get-card/{card_id}/';
  static String defaultCard = '/card/is_default/{card_id}/';
  static String contacts = '/card/registered_contacts/';
  static String getCompanies = '/accounts/companies/';
  static String getCompanyDetails = '/card/company-details/{company_id}/';
  static String getBusinessCategory = '/card/business_category/';
  static String createCardBanking =
      '/card/bank-details-retrieve-delete/{card-id}/';
  static String createCardBusiness = '/card/edit-business-details/{card_id}/';
  static String patchPersonalDetails =
      '/card/personal-detail-update-delete/{personal_details_id}/';

  static String addLogo = '/card/logo-create/';
  static String deleteLogo = '/card/logo-update-delete/{logo_id}/';
  static String editLogo = '/card/logo-update-delete/{logo_id}/';
  static String addProduct = '/card/product-create/';
  static String deleteProduct = '/card/product-update-delete/{product_id}/';
  static String addBranchOffice = '/card/branch-office-create/';
  static String deleteBranchOffice =
      '/card/branch-office-update-delete/{branch_office_id}/';
  static String addBrochure = '/card/brochure-create/';
  static String deleteBrochure = '/card/brochure-update-delete/{brochure_id}/';
  static String addAccolaade = '/card/accolade-create/';
  static String deleteAccolaade = '/card/accolade-update-delete/{accolade_id}/';
  static String addAcredition = '/card/accreditation-create/';
  static String deleteAcredition =
      '/card/accreditation-update-delete/{acredition_id}/';
  static String addSocialMedia = '/card/personal-social-media-create/';
  static String deleteSocialMedia =
      '/card/personal-social-media-update-delete/{social_media_id}/';
  static String addDatesToRemember = '/card/dates-to-remember-create/';
  static String deleteDatesToRemember =
      '/card/dates-to-remember-update-delete/{dates_to_remember_id}/';
  static String addBusinessSocialMedia = '/card/business-social-media-create/';
  static String deleteBusinessSocialMedia =
      '/card/business-social-media-update-delete/{social_media_id}/';
  static String getCardViewsList = '/card/views/{card_id}/';

// qr
  static String getQr = '/level/list-qr/';
  static String levelsharingEdit =
      '/level/level-sharing-update/{level_sharing_id}/';
  static String getCardByUserId = '/card/card_of_another_user/{user_id}/';
  static String getCardByCardId = '/card/get-card/{card_id}/';

// connection
  static String createBizkitConnection = '/connections/create-connections/';
  static String bizkitConnectionListing = '/connections/list-connections/';
  static String addTagToBizkitconnection =
      '/connections/edit-connections/{connection_id}/';
  static String blockBizkitConnecction =
      '/connections/edit-connections/{connection_id}/';
  static String searchBizkitUser = '/accounts/new-connection/';
  static String connectionRequest = '/connections/connection-request/';
  static String deleteConnectionRequest =
      '/connections/delete-connection-request/{id}/';

// reminder
  static String createReminder = '/reminder/create-reminder/';
  static String editReminder = '/reminder/edit-reminder/{reminder_id}/';
  static String getReminderDetails = '/reminder/get-reminder/{reminder_id}/';
  static String getCardReminders = '/reminder/current-user-to-card-reminder/';
  static String getAllReminder = '/reminder/all-reminder-list/';
  static String getTodaysReminder = '/reminder/today-reminder-list/';
  static String getUpcomingReminder = '/reminder/upcoming-reminder-list/';
  static String getHistoryReminder = '/reminder/reminder-history-list/';

// profile section
  static String reportAProblem = '/accounts/report-problem-in-app/';
  static String getProfileInfo = '/accounts/profile/';
  static String editProfileInfo = '/accounts/update-profile/';
  static String deleteProfile = '/accounts/update-profile/';
  static String archeivedCardsList = '/card/archived-cards/';
  static String getDeletedCards = '/card/deleted-cards/';
  static String defaultQr = '/level/common-level-sharing-update/';
  static String getBlockedConnections =
      '/connections/list-blocked-connections/';
  static String restreArcheivedCard = '/card/get-card/{card_id}/';
  static String faq = '/faq/';
  static String notification = '/notification/notifications-list/';
  static String createSecondCard = '/card-connections/business-card/';
  static String getSingleCardSecons =
      '/card-connections/business-card-retrieve-update/{id}/';

// second card
  static String getSecondCard =
      '/card-connections/business-card-retrieve-update/{id}';
  static String getAllCardSecond = '/card-connections/business-card/';
  static String updateCardSecond =
      '/card-connections/business-card-retrieve-update/{id}/';

  static String getDeletedSecondCard = '/card-connections/deleted-cards/';
}
