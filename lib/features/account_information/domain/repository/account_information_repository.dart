import 'package:apple_gadgets_task/const/model/api_response.dart';

import '../../data/model/account_information_model.dart';
import '../../data/source/account_information_service.dart';

abstract class AccountInformationRepository {
  final AccountInformationService accountInformationService;

  AccountInformationRepository(this.accountInformationService);

  Future<Response<GetAccountInformationModel?>?> accountInformationPass({String? username, String? token});

}
