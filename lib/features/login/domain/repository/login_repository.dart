import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../data/model/device_info_model.dart';
import '../../data/model/login_model.dart';
import '../../data/model/user_login_status_model.dart';
import '../../data/source/login_service.dart';

abstract class SignInRepository {
  final SignInService loginService;

  SignInRepository(this.loginService);

  Future<Response<LoginModel?>?> loginWithIdPass(
      {required String userName,
      required String password,});

  // Future<bool?> saveUserLoginInfo({required LoggedInUserData userData});

  Future<Response<UserLoggedInModel>?> userLoginStatus();
}
