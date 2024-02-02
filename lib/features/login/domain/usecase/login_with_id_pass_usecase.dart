import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../data/model/login_model.dart';
import 'login_usecase.dart';

class LoginWithIdPassUseCase extends LoginUseCase {
  LoginWithIdPassUseCase(super.loginRepository);

  Future<Response<LoginModel?>?> call(
      {required String userName,
      required String password,
      }) async {
    return await loginRepository.loginWithIdPass(
        userName: userName,
        password: password,);
  }
}
