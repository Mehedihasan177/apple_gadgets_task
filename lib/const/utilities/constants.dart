// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_string_escapes, depend_on_referenced_packages

import 'package:logger/logger.dart';

class Constants {
  static const KEY_POSTED_JOBS = "p";
  static const KEY_NEW_APPLICATIONS = "N";
  static const KEY_LIVE_JOBS = "L";
  static const KEY_RECENT_JOBS = "R";
  static const KEY_ARCHIVED_JOBS = "A";
  static const KEY_DRAFTED_JOBS = "D";
  static const APP_ID_ANDROID = '2';
  static const APP_ID_IOS = '6';

  static var JOB_NO = "";
  static var JOB_NAME = "";

  static var clickToRemoveSingleScheduleApplicant = false;

  static var isConnectedToBdjobs = true;
  static var APPLY_ID = "ApplyId";
  static var JOB_STEP = "JobStep";

  static const SESSION_FOR_VIDEO_SEEN = "yesSeen";

  static const MESSAGE_NO_INTERNET =
      "You are not connceted to internet. Please turn on wifi or mobile internet then try again.";
  static const REQUEST_TIMEOUT_MESSAGE =
      "Request timeout. Please check your internet connection. Internet slow or finish data.";
  static const KEY_REJECTED = "rej";
  static const KEY_NOT_VIEWED = "nvwd";
  static const KEY_VIEWED = "vwd";
  static const KEY_SHORTLISTED = "sl";
  static const KEY_INTERVIEW_LIST = "il";
  static const KEY_FINAL_HIRED_LIST = "fl";
  static const KEY_FINAL_HIRING_LIST = "flh";
  static const APP_NAME = "Bdjobs Employer";
  static const SESSION_KEY_SP_Designation = "sPDesignation";
  static const SESSION_KEY_SP_ContactPhone = "sPContactPhone";
  static const SESSION_KEY_SP_ContactEmail = "sPContactEmail";
  static const SESSION_KEY_SP_Image = "sPImage";
  static const SESSION_KEY_SP_NAME = "sPName";
  static const SESSION_KEY_COMPANY_ID = "compnayid";
  static const SESSION_KEY_SECRET_CODE = "secretcode";
  static const SESSION_KEY_COMUSRACC = "comusracc";
  static const SESSION_KEY_ADMINUSERTYPE = "adminusertype";
  static const SESSION_KEY_CRDT = "crdt";
  static const SESSION_KEY_NEWDESIGN = "newdesign";
  static const SESSION_KEY_CONTACT_PERSON = "contactperson";
  static const SESSION_KEY_COMPANY_NAME = "compnayname";
  static const SESSION_KEY_EMAIL = "email";
  static const SESSION_KEY_USER_NAME = "user_name";
  static const SESSION_KEY_BILLING_CONTACT = "billingcontact";
  static const SESSION_KEY_CONTRACT_PERSON_COUNTRY = "contactpersoncountry";
  static const SESSION_KEY_LOGIN_ID = "loginid";
  static const SESSION_KEY_CPCITY = "CPCity";
  static const SESSION_KEY_COM_CODE = "ComCODE";
  static const SESSION_KEY_COMID_DECODE = "ComIDDecode";
  static const SESSION_KEY_ISLOGGEDIN = "isloggedin";
  static const SESSION_KEY_APP_ID = "appId";
  static const SESSION_KEY_USER_AUTH = "UserAuthentication";
  static const SESSION_KEY_FCMTOKEN = "FCMToken";
  static const SESSION_KEY_LAST_LOGIN_TIME = "LastLoginTime";
  static const SESSION_PREVIOUS_VERSION_CODE = "previousVersionCode";

  static String dashboardTrueOrFalse = "";

  static String DASHBOARD_MODEL = '';
  static const CUSTOMER_CARE_NUMBER = "16479";
  static const String BDJOBS_DHAKA_OFFICE_LATITUDE = '23.7510096';
  static const String BDJOBS_DHAKA_OFFICE_LONGITUDE = '90.3931006';

  static const String BDJOBS_TERMS_AND_CONDITIONS_LINK =
      'https://www.bdjobs.com/tos.asp';

  static const String BDJOBS_SERVICE_PACKAGES_LINK =
      'https://corporate3.bdjobs.com/services.asp';

  static const String BDJOBS_PRIVACY_POLICY_LINK =
      'https://www.bdjobs.com/policy/Privacy_policy.asp';

  static const String BDJOBS_EMPLOYER_APP_GOOGLE_PLAY_STORE_LINK =
      'https://play.google.com/store/apps/details?id=com.bdjobs.recruiter';

  static const String BDJOBS_JOBSEEKER_APP_GOOGLE_PLAY_STORE_LINK =
      'https://play.google.com/store/apps/details?id=com.bdjobs.app';

  static const String BDJOBS_JOBSEEKER_APP_APPLE_APP_STORE_LINK =
      'https://apps.apple.com/us/app/bdjobs/id1435728822';

  static const String BDJOBS_EMPLOYER_PASSWORD_RESET_LINK =
      'https://corporate3.bdjobs.com/password/';

  static const String ARCHIVE_A_POSTED_JOB = 'ap';
  static const String DELETE_A_ARCHIVE_JOB = 'da';
  static const String DELETE_A_DRAFTED_JOB = 'dd';
  static const String RESTORE_A_ARCHIVE_JOB = 'ra';
  static const String DRAFTED_JOB_READY_TO_PROCESS = 'djrp';
  static const String specialChar = '[%&,()-<>:;/?*\+\"\'|]';
  static const String addStepNameSpecialChars = '[\'^!\@\%<>\$\#*&,\"]';
  static const String smsTextSpecialChars = '[\'\#\%*&-=\_]';
  static const String userNameRestrictChar = '[%,<>\"\' ]\\/?';
  static const String passwordRestrictChar = '[\',%><\"&() ]';

  // static List<String> userList = List<String>[];
  static List<String> degreeLevel = [
    'Any',
    'Diploma',
    'Bachelor/Honors',
    'Masters',
    'Doctoral'
  ];

  static List<String> result = [
    'Any',
    'First Class',
    'Second Class',
    'Third Class',
    'Grade',
    'Appeared',
    'Enrolled',
    'Awarded',
  ];

  static List<String> major = [
    'Any',
    "Accounting",
    "Accounting &amp; Information System",
    "Agriculture",
    "Agro-technology",
    "Animal Husbandry",
    "Anthropology",
    "Applied Chemistry",
    "Applied Mathematics",
    "Applied Physics",
    "Arabic",
    "Archaeology",
    "Architecture",
    "Arts",
    "Automobile",
    "Banking",
    "Bengali",
    "Biochemistry",
    "Biology",
    "Biotechnology",
    "Botany",
    "Brand Management",
    "Business Administration",
    "Business Studies",
    "Chemical Technical/Engineering",
    "Chemistry",
    "Civil Engineering",
    "Commerce",
    "Commerce",
    "Communication Engineering",
    "Computer Applications",
    "Computer Engineering",
    "Computer Science",
    "Computer Science &amp; Engineering",
    "Computing &amp; Information System",
    "Cost &amp; Management Accounting",
    "Cost Accounting",
    "Development Studies",
    "Economics",
    "Education",
    "Electrical &amp; Electronic Engineering",
    "Electronics",
    "Electronics and Telecommunication Engineering",
    "English",
    "Environmental Planning",
    "Environmental Science",
    "Finance",
    "Finance &amp; Banking",
    "Fine Arts",
    "Fisheries",
    "Flim and Media",
    "Forestry",
    "Genetics",
    "Geography",
    "Geography and Environment",
    "Geology",
    "Government &amp; Politics",
    "History",
    "Horticulture",
    "Hospitality Management",
    "Hospitality Management",
    "Human Resource Management",
    "Industrial Eng &amp; Production",
    "Industrial Engineering",
    "Industrial Management",
    "Industrial Relations",
    "Information Engineering",
    "Information Science &amp; Library Management",
    "Information Systems",
    "Information Technology",
    "Insurance",
    "International Business",
    "International Relations",
    "Islamic History &amp; Culture",
    "Islamic Studies",
    "Journalism",
    "Law",
    "Linguistics",
    "Management",
    "Management Information System",
    "Management Studies/Science",
    "Marine Engineering",
    "Marketing",
    "Mass Communication &amp; Journalism",
    "Materials &amp; Metallurgical Engineering",
    "Mathematics",
    "Mechanical Engineering",
    "Medicine",
    "Microbiology",
    "Nautical Science",
    "Naval Architecture and Marine Engineering",
    "Personnel Management",
    "Petroleum and Mineral Resource Engineering",
    "Pharmaceutical Technology",
    "Pharmacology",
    "Pharmacy",
    "Philosophy",
    "Physics",
    "Political Science",
    "Population Science",
    "Psychology",
    "Public Administration",
    "Public Health",
    "Public Relations",
    "Sanskrit &amp; Pali",
    "Science",
    "Service Marketing",
    "Social Science",
    "Sociology",
    "Statistics",
    "Strategic Management",
    "Supply Chain Management",
    "Telecommunication",
    "Textile Technology",
    "Theater &amp; Music",
    "Urban &amp; Regional Planning",
    "Urdu &amp; Persian",
    "Veterinary Science",
    "Water Resources Engineering",
    "Women Studies",
    "World Religions",
    "Zoology"
  ];

  static const String defaultEmailSubject = "";
  static const String defaultEmailBody = "";
}

final logger = Logger();
