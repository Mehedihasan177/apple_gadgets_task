import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../domain/repository/account_information_repository.dart';
import '../model/account_information_model.dart';

class AccountInformationImpl extends AccountInformationRepository {
  AccountInformationImpl(super.accountInformationService);

  @override
  Future<Response<GetAccountInformationModel?>?> accountInformationPass({String? username, String? token}) async {
    return await accountInformationService.accountInformationServicePass(username: username, token: token);
  }
}
