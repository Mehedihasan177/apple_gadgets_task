// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_string_escapes, depend_on_referenced_packages

import 'package:logger/logger.dart';

class Constants {
  static const SESSION_KEY_ISLOGGEDIN = "isloggedin";
  static const SESSION_KEY_PASSWORD = "password";
  static const SESSION_KEY_USERNAME = "username";
  static var isConnected = true;
  static const MESSAGE_NO_INTERNET =
      "You are not connceted to internet. Please turn on wifi or mobile internet then try again.";
  static const REQUEST_TIMEOUT_MESSAGE =
      "Request timeout. Please check your internet connection. Internet slow or finish data.";
  static const String userNameRestrictChar = '[%,<>\"\' ]\\/?';
  static const String passwordRestrictChar = '[\',%><\"&() ]';
}

final logger = Logger();
