class ApiEndPoints {
  // [ Render base url ]
  //static const String baseUrl = 'https://bizkit.onrender.com';

  // [ Local base url  ]
  // static const String baseUrl = 'https://9jdcxxr1-8000.inc1.devtunnels.ms';

  // [ AWS base url ]
  static const String baseUrl = 'http://16.171.232.253';

  // Refesh token
  static const String refreshUrl = '/token/';

  // ---------------------------------------------------------------------------------------------
  // [ General Routes ]

  // [ Auth ]
  static const String login = '/login/';
  static const String logOut = '/logout/';
  static const String register = '/register/';
  static const String sendOtpMail = '/verification/send_verification_email/';
  static const String verifyOtp = '/verify-otp/';
  static const String passwordLogin = '/password-login/';
  static const String forgotPassword = '/verification/forgot_password/';
  static const String verifyforgotPassword = '/verification/verify_forgot_password/';
  static const String forgottPassword = '/verification/change_password/';
  static const String forgottPasswordProfile = '/accounts/password_change/';


  /// [ profile ]
  static const String nameAndImage='/update-pic-or-name/';
  ///update phone and update email
  static const String updateEmailorPhone = '/update-contact/';
  static const String getUserProfileDetais = '/get-user-profile/';


  //  [  Matcho meter ]
  static const String matchoMeter = '/matcho-meter/';


  // ---------------------------------------------------------------------------------------------
  /// [ Bizcard Module  ]

  static const String searchCardUsers = '/search-card-users/';
  static const String scanAndConnect = '/scan-and-connect/';

  // [ Card Creation ]
  static const String card = '/get-bizcards/';
  static const String cardCreationInital = '/initial-details/';
  static const String cardDetail = '/get-bizcard-detail/';
  static const String cardCreationPersonalDetails = '/personal-details/';
  static const String cardSetDefault = '/set-default/';
  static const String getArchievedOrDeletedCards =
      '/list-disabled-and-archieved-cards/';
  static const String cardArchiveOrDelete = '/archieve-or-disable-card/';
  static const String cardViews = '/card-views/';

  //Personl Details
  static const String personalAchievement = '/personal-achievements/';
  static const String personalSocialedia = '/personal-social-media/';
  static const String personalDatesToReminder = '/personal-dates-to-remember/';

  // [ Business Details ]
  static const String businessDetils = '/business-details/';
  static const String businessAchievement = '/business-achievements/';
  static const String businessSocialedia = '/business-social-media/';
  static const String businessProduct = '/business-products/';
  static const String businessBranch = '/business-branch-offices/';
  static const String businessBrochure = '/business-brochures/';
  static const String businessLogo = '/business-logo-details/';
  static const String bankDetails = '/business-details/bank-details/';

  // [ Text Extraction ]
  static const String textExtraction = '/extract-text/';

  // [ Contacts ]
  static const String contacts = '/check-contacts/';
  static const String shareCardToContacts = '/share-my-card/';

  // [ Visiting card ]
  static const String visitingCard = '/visiting-cards/';
  static const String visitingCardDetails = '/visiting-cards/{visitingCardId}/';
  static const String getAllDeletedVisitingCards = '/deleted-visiting-cards/';
  static const String getAllVisitingCards = '/list-visiting-cards/';

  // [ Level Sharing ]
  static const String commonLevelSharing = '/common-shared-fields/';
  static const String individualLevelSharing = '/individual-shared-fields/';

  // [ Bizcard connection ]
  static const String sentConnectionRequest = '/sent-connection-request/';
  static const String recievedConnectionRequests = '/recieved-connection-requests/';
  static const String myConnections = '/my-connections/';
  static const String getAllSendConnectionRequests = '/send-connection-requests/';
  static const String followbackRequest = '/follow-back-request/';
  static const String cancelConnectionRequest = '/cancel-connection-request/';
  static const String searchConnection = '/search-connection/';
  static const String unfollowConnection = '/un-follow-connection/';
  static const String viewConnectionCards = '/view-shared-bizcard-details/';
  static const String updateConnectionDetails = '/update-connection-details/';
  static const String checkConnectionExists = '/check-connection/';
  static const String sharedCardRequests = '/shared-cards-requests/';

  // [ Reminder ]
  static const String reminder = '/reminder/';
  static const String getReminders = '/get-reminders/';
  static const String getCardRemindersHistory = '/get-card-reminders/';

  // ---------------------------------------------------------------------------------------------
  /// [ TASK MODULE ]

  static const String taskTestgetAllTasks = '/user-tasks/';
  static const String taskTestCreateTask = '/tasks/create/';
  static const String taskTestEditTask = '/tasks/';
  static const String taskTestSpotLightTask = '/task-spot-light/';
  static const String taskTestSendRequests = '/get-send-requests/';
  static const String taskTestReceivedRequests = '/task-requests/';
  static const String taskTestFilterByDeadline = '/filter-tasks-by-deadine/';
  static const String taskTestPinnedATask = '/pinned-tasks/';
  static const String taskTestFilterByType = '/filter-tasks/';
  static const String taskTestFolders = '/task-folders/';
  static const String taskTestAcceptOrReject = '/tasks/accept-reject/';
  static const String taskTestFindUser = '/find-user/';
  static const String taskTestTaskSearch = '/search-tasks/';
  static const String taskTestSubtask = '/tasks/sub-task/';
  static const String taskTestMergeFolders = '/merge-folders/';
  static const String taskTestMergeInnerFolders = '/merge-inner-folders/';
  static const String taskTestProgresBar = '/get-count-of-tasks/';
  static const String taskTestGetTasksCounts = '/get-count-by-date/';
  static const String taskTestFilterFolders = '/filter-folders/';
  static const String taskTestGenerateTaskReport = '/generate-task-report/';
  static const String taskTestProvideTaskReport = '/provide-task-report/';
  static const String taskTestCompletedTasks = '/get-completed-tasks/';
  static const String taskTestKilledTasks = '/get-killed-tasks/';
  static const String taskTestGetTaskExpense = '/get-expense-data/';
  static const String taskTestGetTaskTotalTime = '/get-time-data/';
  static const String taskTestGetRecentTasks = '/get-recent-tasks/';
  static const String taskTestGetTaskTotalTimeAndExpense = '/get-time-expense-data/';
  static const String taskTestRestoreTask = '/restore-task/';
}
