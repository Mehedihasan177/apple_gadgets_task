// ignore_for_file: constant_identifier_names
class ApiConfiguration {
  static const String BASE_URL = "https://peanut.ifxdb.com";
  static const String LOGIN_URL = "/api/ClientCabinetBasic/IsAccountCredentialsCorrect";
  static const String ACCOUNT_INFORMATION = "/api/ClientCabinetBasic/GetAccountInformation";
  static const int connectionError = -1;

  //--------------------------------------------------------------------------//

  static const int CONNECTION_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
}
