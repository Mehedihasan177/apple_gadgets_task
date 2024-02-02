// ignore_for_file: use_build_context_synchronously
import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/route/route_name.dart';
import 'package:apple_gadgets_task/const/route/router.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  submitLoginData({required context, required isFromMasterLogin}) async {
    showLoaderScreen.value = true;
    try {
      final LoginWithIdPassUseCase loginUseCase = LoginWithIdPassUseCase(
        locator<SignInRepository>(),
      );
      var response = await loginUseCase(
        userName: userName.value,
        password: password.value,
      );

      if (response?.data != null) {
        String? token = response?.data?.token;
        if (token != null) {
          session.tokenInsert(token);
          session.passwordInsert(password.value);
          session.usernameInsert(userName.value);
          RouteGenerator.pushNamedAndRemoveAll(context, Routes.homepage);
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
    print(response?.data?.token);
    // if (response?.data != null) {
    //   RouteGenerator.pushNamedAndRemoveAll(context, Routes.homepage);
    // } else {
      RouteGenerator.pushReplacementNamed(context, Routes.loginScreenRouteName);
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
