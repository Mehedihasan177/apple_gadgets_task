import 'dart:convert';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/route/route_name.dart';
import 'package:apple_gadgets_task/const/route/router.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../login.dart';

class SignInController extends GetxController {
  var showLoaderScreen = false.obs;
  var userName = ''.obs;
  var userNameError = ''.obs;
  var password = ''.obs;
  var companyId = ''.obs;
  var passwordError = ''.obs;
  var passwordVisibility = true.obs;
  var isFormValid = false.obs;
  final session = locator<SessionManager>();
  // DashboardController dashboardController = Get.put(
  //   DashboardController(),
  // );

submitLoginData({required context, required isFromMasterLogin}) async {
  try {
    final LoginWithIdPassUseCase loginUseCase = LoginWithIdPassUseCase(
      locator<SignInRepository>(),
    );
    var response = await loginUseCase(
      userName: userName.value,
      password: password.value,
    );

    if (response?.data != null) {
      // Access the 'token' directly from the response JSON
      String? token = response?.data?.token;
print("this is token $token");
      if (token != null) {
        print('Login successful. Token: $token');
        // Now you can use the token as needed
      } else {
        CommonMethods.showToast('Token is null', ColorResources.WHITE);
      }
    } else {
      CommonMethods.showToast('Response data is null', ColorResources.WHITE);
    }
  } catch (e) {
    CommonMethods.showToast(e.toString(), ColorResources.WHITE);
  } finally {
    showLoaderScreen.value = false;
  }
}


  void checkLoginStatus(BuildContext context) async {
    final UserLoginStatus userLoginStatus = UserLoginStatus(
      locator<SignInRepository>(),
    );
    var response = await userLoginStatus();
    // SignOutUserUseCase logoutUserUseCase = SignOutUserUseCase();
    // var logoutResponse = await logoutUserUseCase();
RouteGenerator.pushReplacementNamed(
            context, Routes.loginScreenRouteName);
    // try {
    //   if (response != null && response.data?.isLoggedIn == true) {
    //     final loginEntryDay = response.data?.lastLoggedInDate;
    //     DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    //     DateTime dateTime = dateFormat.parse(
    //         loginEntryDay == null || loginEntryDay.isEmpty
    //             ? DateTime.now().toIso8601String()
    //             : loginEntryDay);
    //   }
    // } catch (e) {
    //   session.clearSession();
    //   if (context.mounted) {
    //     RouteGenerator.pushReplacementNamed(
    //         context, Routes.loginScreenRouteName);
    //   }
    // }
  }

  void setUserName(String value) {
    userName.value = value;
    if (value.isEmpty) {
      userNameError.value = 'Username can not be empty.';
    } else {
      userNameError.value = '';
    }
  }

  void setPassword(String value) {
    password.value = value;
    if (value.isEmpty) {
      passwordError.value = 'Password can not be empty.';
    } else {
      passwordError.value = '';
    }
  }
}
