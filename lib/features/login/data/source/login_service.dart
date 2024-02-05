import 'dart:convert';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/const/network/configuration.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
// import 'package:get/get.dart';
import '../../../../const/controllers/user_store_get_controller.dart';
import '../model/login_model.dart';
import '../model/user_login_status_model.dart';

class SignInService {
  final DioClient _dioClient = locator<DioClient>();
  UserCatchController userCatchController = locator<UserCatchController>();
  Future<Response<LoginModel>?> loginWithIdPass({
    required String userName,
    required String password,
  }) async {
    Response<LoginModel>? apiResponse;

    final requestBody = {
      'login': "$userName",
      'password': "$password",
    };

    try {
      await _dioClient.post(
        request: jsonEncode(requestBody),
        path: ApiConfiguration.BASE_URL + ApiConfiguration.LOGIN_URL,
        responseCallback: (response, message) {
          apiResponse = Response.success(LoginModel.fromJson(response));
        },
        failureCallback: (message, status) {
          apiResponse = Response.error(message, status);
        },
      );
    } catch (error) {
      CommonMethods.showToast("${error.toString()}");
      print('Dio request failed with error: $error');
    }

    return apiResponse;
  }

  Future<Response<UserToken>>? checkUserLoginStatus() async {
    return Response.success(UserToken(
      token: userCatchController.token.value ?? '',
    ));
  }
}
