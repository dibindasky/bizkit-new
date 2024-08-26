class ApiEndPoints {
  static String baseUrl = 'https://bizkit.onrender.com';
  //static String baseUrl = 'https://9jdcxxr1-8000.inc1.devtunnels.ms';

  // refesh token
  static String refreshUrl = '/token/';

  // auth
  static String login = '/login/';
  static String logOut = '/logout/';
  static String register = '/register/';
  static String sendOtpMail = '/verification/send_verification_email/';
  static String verifyOtp = '/verify-otp/';
  static String forgotPassword = '/verification/forgot_password/';
  static String verifyforgotPassword = '/verification/verify_forgot_password/';
  static String forgottPassword = '/verification/change_password/';
  static String forgottPasswordProfile = '/accounts/password_change/';

  // Card Creation
  static String card = '/get-bizcards/';
  static String cardCreationInital = '/initial-details/';
  static String cardDetail = '/get-bizcard-detail/';
  static String cardCreationPersonalDetails = '/personal-details/';

  static String cardSetDefault = '/set-default/';
  static String getArchievedOrDeletedCards =
      '/list-disabled-and-archieved-cards/';
  static String cardArchiveOrDelete = '/archieve-or-disable-card/';
  static String personalAchievement = '/personal-achievements/';
  static String personalSocialedia = '/personal-social-media/';
  static String personalDatesToReminder = '/personal-dates-to-remember/';

  // [ Text Extraction ]
  static String textExtraction = '/extract-text/';

  static String contacts = '/card/registered_contacts/';

  // [ Visiting card ]
  static String visitingCard = '/visiting-cards/';
  static String getAllDeletedVisitingCards = '/deleted-visiting-cards/';
  static String getAllVisitingCards = '/list-visiting-cards/';

  // ------------------------------------------------------------------------------------------
  // [ TASK MODULE TEST APIENDPOINTS ]

  static const taskTestgetAllTasks = '/user-tasks/';
  static const taskTestCreateTask = '/tasks/create/';
  static const taskTestEditTask = '/tasks/';
  static const taskTestSpotLightTask = '/task-spot-light/';
  static const taskTestSendRequests = '/get-send-requests/';
  static const taskTestReceivedRequests = '/task-requests/';
  static const taskTestFilterByDeadline = '/filter-tasks-by-deadine/';
  static const taskTestPinnedATask = '/pinned-tasks/';
  static const taskTestFilterByType = '/filter-tasks/';
  static const taskTestFolders = '/task-folders/';
  static const taskTestAcceptOrReject = '/tasks/accept-reject/';
  static const taskTestFindUser = '/find-user/';
  static const taskTestTaskSearch = '/search-tasks/';
  static const taskTestSubtask = '/tasks/sub-task/';
  static const taskTestMergeFolders = '/merge-folders/';
  static const taskTestMergeInnerFolders = '/merge-inner-folders/';
  static const taskTestProgresBar = '/get-count-of-tasks/';
  static const taskTestGetTasksCounts = '/get-count-by-date/';
  static const taskTestFilterFolders = '/filter-folders/';
  static const taskTestGenerateTaskReport = '/generate-task-report/';
  static const taskTestProvideTaskReport = '/provide-task-report/';
  static const taskTestCompletedTasks = '/get-completed-tasks/';
  static const taskTestKilledTasks = '/get-killed-tasks/';
  static const taskTestGetTaskExpense = '/get-expense-data/';
  static const taskTestGetTaskTotalTime = '/get-time-data/';
  static const taskTestGetRecentTasks = '/get-recent-tasks/';
  static const taskTestRestoreTask = '/restore-task/';
}
