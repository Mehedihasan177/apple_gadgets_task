import 'dart:convert';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/const/network/configuration.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import '../model/account_information_model.dart';



class AccountInformationService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<GetAccountInformationModel>?> accountInformationServicePass({String? username, String? token}) async {
    Response<GetAccountInformationModel>? apiResponse;

    final requestBody = {
      'login': "$username",
      'token': "$token",
    };

   
      await _dioClient.post(
        request: jsonEncode(requestBody),
        path:
            "https://peanut.ifxdb.com/api/ClientCabinetBasic/GetAccountInformationAsync",
        responseCallback: (response, message) {
          print("message: $message jhgjkgkjg $response");
          apiResponse = Response.success(GetAccountInformationModel.fromJson(response));
        },
        failureCallback: (message, status) {
          print("message: $message $status");
          apiResponse = Response.error(message, status);
        },
      );
    

    return apiResponse;
  }

}
