// ignore_for_file: use_build_context_synchronously
import 'dart:ffi';

import 'package:apple_gadgets_task/const/controllers/user_store_get_controller.dart';
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
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var userName = ''.obs;
  var userNameError = ''.obs;
  var password = ''.obs;
  var companyId = ''.obs;
  var passwordError = ''.obs;
  var passwordVisibility = true.obs;
  var isFormValid = false.obs;
  final LoginWithIdPassUseCase loginUseCase = LoginWithIdPassUseCase(
    locator<SignInRepository>(),
  );
  var userCatchController = Get.put(UserCatchController());

  submitLoginData({required context}) async {
    showLoaderScreen.value = true;
    try {
      var response = await loginUseCase(
        userName: usernameController.value.text,
        password: passwordController.value.text,
      );

      if (response?.data != null) {
        String? token = response?.data?.token;
        if (token != null) {
          userCatchController.storeValue(usernameController.value.text, token);
          RouteGenerator.pushNamedAndRemoveAll(context, Routes.homepage);
        } else {
          CommonMethods.showToast('Token is null', ColorResources.RED);
        }
      } else {
        CommonMethods.showToast('Response data is null', ColorResources.RED);
      }
    } catch (e) {
      CommonMethods.showToast(e.toString(), ColorResources.RED);
    } finally {
      userCatchController.getValue();
      showLoaderScreen.value = false;
    }
  }

  void checkLoginStatus(BuildContext context) async {
    final UserLoginStatus userLoginStatus = UserLoginStatus(
      locator<SignInRepository>(),
    );

    var response = await userLoginStatus();
    if ((userCatchController.token.value.isNotEmpty)) {
      RouteGenerator.pushNamedAndRemoveAll(context, Routes.homepage);
    } else {
      RouteGenerator.pushReplacementNamed(context, Routes.loginScreenRouteName);
    }
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
