import 'dart:core';
import 'dart:io';

import 'package:apple_gadgets_task/const/network/configuration.dart';
import 'package:apple_gadgets_task/const/network/network_connection_manager.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:apple_gadgets_task/const/utilities/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';



class DioClient {
  final Dio dio;

  DioClient(this.dio);

  CancelToken _cancelToken = CancelToken();

  Future<Response?> post({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    dynamic header,
  }) async {
    Response? response;
    try {
      // _cancelToken.cancel("Cancelled due to new request");
      // _cancelToken = CancelToken();
      if (Constants.isConnectedToBdjobs) {
        // isInternetConnectionAvailable.value = true;
        response = await dio.post(

          // cancelToken: _cancelToken,
          path,
          data: request,
          
          options: Options(
            method: "POST",
            headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': '*/*',
        },
            // contentType:
            //     "application/json; charset=utf-8 ",
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );
       

        if (response.data != null) {
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else {
        CommonMethods.showToast(
            Constants.MESSAGE_NO_INTERNET, ColorResources.WHITE);
      }
    } catch (e) {
      failureCallback("Something went wrong!", 400);
    }
    return response;
  }

  Future<Response?> get({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    Map<String, dynamic>? queryParameters,
    bool includeHeader = false,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        response = await dio.get(
          path,
          queryParameters: queryParameters,
          options: Options(
            // headers: includeHeader ? getHeader(locator<SessionManager>()) : {},
            contentType: Headers.formUrlEncodedContentType,
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );
        if (response.data != null && response.statusCode == HttpStatus.ok) {
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else if (connectivityResult == ConnectivityResult.none) {
        failureCallback("No Internet Connection", 12029);
      }
    } on Exception catch (e, _) {
      failureCallback("Try Again", 400);
    }
    return response;
  }
}

// Map<String, dynamic> getHeader(SessionManager session) {
//   // logger.d('cCode: ${session.companyCode} :: cId: ${session.companyId} :: cc: ${session.companyCreation} :: lId: ${session.loginId} :: X_Api_Auth: ${session.comCODE}');
//   return {
//     NetworkConfiguration.HEADER_KEY_CONTENT_TYPE: 'application/json',
//   };
// }
