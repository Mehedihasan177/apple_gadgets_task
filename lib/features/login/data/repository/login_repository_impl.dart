import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../domain/repository/login_repository.dart';
import '../model/login_model.dart';
import '../model/user_login_status_model.dart';

class SignInRepositoryImpl extends SignInRepository {
  SignInRepositoryImpl(super.loginService);

  @override
  Future<Response<LoginModel?>?> loginWithIdPass({
    required String userName,
    required String password,
  }) async {
    return await loginService.loginWithIdPass(
      userName: userName,
      password: password,
    );
  }

  @override
  Future<Response<UserToken>?> userLoginStatus() async {
    return await loginService.checkUserLoginStatus();
  }
}
