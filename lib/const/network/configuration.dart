// ignore_for_file: constant_identifier_names
class ApiConfiguration {
  static const String BASE_URL = "https://peanut.ifxdb.com";
  static const String LOGIN_URL =
      "/api/ClientCabinetBasic/IsAccountCredentialsCorrect";
  static const String ACCOUNT_INFORMATION =
      "/api/ClientCabinetBasic/GetAccountInformation";
  static const String OPEN_TRADES = "/api/ClientCabinetBasic/GetOpenTrades";
  static const String PHONE_NUMBER_LAST =
      "/api/ClientCabinetBasic/GetLastFourNumbersPhone";
  static const int connectionError = -1;

  //--------------------------------------------------------------------------//
  static const String PASSWORD = "X_API_COMPANY_ID";
  static const String USERNAME = "X_API_COMPANY_CREATION";
  static const String TOKEN = "X_API_AUTH";

  static const int CONNECTION_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
}
