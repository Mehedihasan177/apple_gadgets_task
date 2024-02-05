import 'dart:convert';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/const/network/configuration.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/get_open_trades_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import '../model/account_information_model.dart';

class AccountInformationService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<GetAccountInformationModel>?> accountInformationServicePass(
      {String? username, String? token}) async {
    Response<GetAccountInformationModel>? apiResponse;
    final requestBody = {
      'login': "$username",
      'token': "$token",
    };
    await _dioClient.post(
      path: ApiConfiguration.BASE_URL + ApiConfiguration.ACCOUNT_INFORMATION,
      request: requestBody,
      responseCallback: (response, message) {
        apiResponse =
            Response.success(GetAccountInformationModel.fromJson(response));
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );
    return apiResponse;
  }

  Future<Response<List<GetOpenTradesModel>?>?> openTradesData(
      {String? username, String? token}) async {
    Response<List<GetOpenTradesModel>?>? apiResponse;

    final requestBody = {
      'login': "${username}",
      'token': "${token}",
    };

    try {
      await _dioClient.post(
        path: ApiConfiguration.BASE_URL + ApiConfiguration.OPEN_TRADES,
        request: requestBody,
        responseCallback: (response, message) {
          List<GetOpenTradesModel> androidVersions = [];
          for (var i in response) {
            print(i['openTime']);
            androidVersions.add(
              GetOpenTradesModel(
                currentPrice: i['currentPrice'],
                comment: i['comment'],
                digits: i['digits'],
                login: i['login'],
                openPrice: i['openPrice'],
                openTime: DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(DateTime.parse(i['openTime']))),
                profit: i['profit'].toString(),
                swaps: i['swaps'],
                symbol: i['symbol'],
                tp: i['tp'],
                ticket: i['ticket'],
                type: i['type'],
                volume: i['volume'],
              ),
            );
          }

          apiResponse = Response.success(androidVersions);
        },
        failureCallback: (message, status) {
          apiResponse = Response.error(message, status);
        },
      );
    } catch (e) {
      print("Exception in openTradesData: $e");
    }

    return apiResponse;
  }

  Future<Response<String>?> lastFourDigitFromPhone(
      {String? username, String? token}) async {
    Response<String>? apiResponse;

    final requestBody = {
      'login': "$username",
      'token': "$token",
    };

    await _dioClient.post(
      path: ApiConfiguration.BASE_URL + ApiConfiguration.PHONE_NUMBER_LAST,
      request: requestBody,
      responseCallback: (response, message) {
        // Assuming the response is a string
        final lastFourDigits = response as String?;

        if (lastFourDigits != null) {
          apiResponse = Response.success(lastFourDigits);
          // print("Successful response: $apiResponse");
        } else {
          // Handle failure if necessary
          apiResponse = Response.error("Failed to get last four digits", 0);
        }
      },
      failureCallback: (message, status) {
        // Handle the error as needed
        apiResponse = Response.error(message, status);
      },
    );
    return apiResponse;
  }
}
