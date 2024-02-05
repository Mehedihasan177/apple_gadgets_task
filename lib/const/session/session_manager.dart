// // ignore_for_file: non_constant_identifier_names

// import 'package:apple_gadgets_task/const/route/route_name.dart';
// import 'package:apple_gadgets_task/const/route/router.dart';
// import 'package:apple_gadgets_task/const/source/pref_manager.dart';
// import 'package:apple_gadgets_task/const/utilities/constants.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SessionManager {
//   Future<bool> dataInsert(token, username, password) async {
//     try {
//       setToken = token;
//       setPassword = password;
//       setUsername = username;
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   final PrefManager _prefManager;

//   SessionManager(this._prefManager);

//   String? get token =>
//       _prefManager.getStringValue(Constants.SESSION_KEY_ISLOGGEDIN);

//   set setToken(String value) =>
//       _prefManager.saveString(Constants.SESSION_KEY_ISLOGGEDIN, value);
//   String? get username =>
//       _prefManager.getStringValue(Constants.SESSION_KEY_USERNAME);

//   set setUsername(String value) =>
//       _prefManager.saveString(Constants.SESSION_KEY_USERNAME, value);
//   String? get password =>
//       _prefManager.getStringValue(Constants.SESSION_KEY_PASSWORD);

//   set setPassword(String value) =>
//       _prefManager.saveString(Constants.SESSION_KEY_PASSWORD, value);

//   logout(BuildContext context) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     RouteGenerator.pushNamedAndRemoveAll(context, Routes.loginScreenRouteName);
//     await preferences.clear();
//   }

//   // Future<bool> logout(BuildContext context) async {
//   //   bool response = false;
//   //   await _prefManager.logOut().whenComplete(() {

//   //     response = true;
//   //   });
//   //   return response;
//   // }
// }
