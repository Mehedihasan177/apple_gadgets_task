import 'dart:convert';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/const/network/configuration.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import '../model/device_info_model.dart';
import '../model/login_model.dart';
import '../model/user_login_status_model.dart';

final session = locator<SessionManager>();

class SignInService {
  final DioClient _dioClient = locator<DioClient>();

Future<Response<LoginModel>?> loginWithIdPass({
  required String userName,
  required String password,
}) async {
  Response<LoginModel>? apiResponse;

  final requestBody = {
    'login': "$userName", // Assuming '0' is a valid value for login
    'password': "$password",
  };

  try {
    await _dioClient.post(
      request: jsonEncode(requestBody),
      path: "https://peanut.ifxdb.com/api/ClientCabinetBasic/IsAccountCredentialsCorrectAsync",
      responseCallback: (response, message) {
        print("message: $message ${json.encode(response['token'])}");
        apiResponse = Response.success(LoginModel.fromJson(response));
      },
      failureCallback: (message, status) {
        print("message: $message $status");
        apiResponse = Response.error(message, status);
      },
    );
  } catch (error) {
    // Handle Dio errors
    print('Dio request failed with error: $error');
  }

  return apiResponse;
}

  Future<Response<UserLoggedInModel>>? checkUserLoginStatus() async {
    return Response.success(UserLoggedInModel(
        isLoggedIn: session.isLoggedIn ?? false,
        lastLoggedInDate: session.loginEntryDate ?? ""));
  }
}
