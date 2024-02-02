import 'dart:io';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/extensions/extensions.dart';
import 'package:apple_gadgets_task/const/route/route_name.dart';
import 'package:apple_gadgets_task/const/route/router.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/assets_path.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:apple_gadgets_task/const/utilities/constants.dart';
import 'package:apple_gadgets_task/const/utilities/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final _loginController = locator<SignInController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              _mainBody(context),
              Obx(
                () => _loginController.showLoaderScreen.value
                    ? CommonMethods.loaderScreen()
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: ListView(
              children: <Widget>[
                
                _usernameTextField(),
                20.ph,
                _passwordTextField(),
                20.ph,
                _buttons(context),
                44.ph,
                _forgetText(context),
                42.ph,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _usernameTextField() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          key: const ValueKey("Username"),
          onChanged: (value) {
            _loginController.setUserName(value);
          },
          decoration: InputDecoration(
            labelStyle: BdjDecorations.textFieldFocusLabelTextStyle(),
            focusedBorder: BdjDecorations.textFieldFocusOutlineInputBorder(),
            border: BdjDecorations.textFieldOutlineInputBorder(),
            labelText: 'Username',
            errorText: _loginController.userNameError.isNotEmpty
                ? _loginController.userNameError.value
                : null,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(8),
            FilteringTextInputFormatter.deny(
                RegExp(Constants.passwordRestrictChar))
          ],
          key: const ValueKey("Password"),
          onChanged: (value) {
            print(value);
            _loginController.setPassword(value);
          },
          obscureText: _loginController.passwordVisibility.value,
          decoration: InputDecoration(
            labelStyle: BdjDecorations.textFieldFocusLabelTextStyle(),
            focusedBorder: BdjDecorations.textFieldFocusOutlineInputBorder(),
            border: BdjDecorations.textFieldOutlineInputBorder(),
            labelText: 'Password',
            errorText: _loginController.passwordError.isNotEmpty
                ? _loginController.passwordError.value
                : null,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _loginController.passwordVisibility.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                _loginController.passwordVisibility.value =
                    !_loginController.passwordVisibility.value;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgetText(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "Forgot username or password?",
          style: TextStyle(
              fontSize: 14,
              color: ColorResources.CORPORATE_ASH,
              backgroundColor: Colors.blueAccent[600]),
        ),
        onPressed: () {
          RouteGenerator.pushNamed(
              context, Routes.forgotPasswordEmailScreenRouteName);
        },
      ),
    );
  }


  Widget _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color:  ColorResources.CORPORATE_ACTION_GREEN
                        ,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  height: 45,
                  child: TextButton(
                    onPressed:  () {
                            FocusScope.of(context).unfocus();
                            _loginController.submitLoginData(
                              context: context,
                              isFromMasterLogin: false,
                            );
                          }
                        ,
                    child: const Text(
                      "Sign In",
                      key: ValueKey("Sign_In"),
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorResources.WHITE,
                      ),
                    ),
                  ),
                ),
              ),
           
          10.pw,
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.CORPORATE_BLUE,
                    backgroundColor: Colors.blueAccent[600],
                  ),
                ),
                onPressed: () {
                  // routes.gotoCreateAccountPage(context);
                  RouteGenerator.pushNamed(context, Routes.signUpScreen);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
