import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../data/model/account_information_model.dart';
import 'account_information_usecase.dart';

class AccountInformationPassUseCase extends AccountInformationUseCase {
  AccountInformationPassUseCase(super.loginRepository);

  Future<Response<GetAccountInformationModel?>?> call({String? username, String? token}) async {
    return await accountInformationRepository.accountInformationPass(username: username, token: token);
  }
}
