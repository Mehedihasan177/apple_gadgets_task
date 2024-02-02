// ignore_for_file: constant_identifier_names
class NetworkConfiguration {
  static const String BASE_URL = "https://peanut.ifxdb.com";
  static const String LOGIN_URL = "/api/ClientCabinetBasic/IsAccountCredentialsCorrect";
  static const int connectionError = -1;

  //--------------------------------------------------------------------------//

  static const int CONNECTION_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
}
