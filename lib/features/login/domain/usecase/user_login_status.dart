import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../data/model/user_login_status_model.dart';
import 'login_usecase.dart';

class UserLoginStatus extends LoginUseCase {
  UserLoginStatus(super.loginRepository);

  Future<Response<UserLoggedInModel>?> call() async {
    return await loginRepository.userLoginStatus();
  }
}
