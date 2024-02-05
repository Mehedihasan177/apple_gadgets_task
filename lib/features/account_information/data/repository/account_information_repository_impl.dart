import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/get_open_trades_model.dart';

import '../../domain/repository/account_information_repository.dart';
import '../model/account_information_model.dart';

class AccountInformationImpl extends AccountInformationRepository {
  AccountInformationImpl(super.accountInformationService);

  @override
  Future<Response<GetAccountInformationModel?>?> accountInformationPass({String? username, String? token}) async {
    return await accountInformationService.accountInformationServicePass(username: username, token: token);
  }
  @override
  Future<Response<dynamic>?> lastFourDigitFromPhone({String? username, String? token}) async {
    return await accountInformationService.lastFourDigitFromPhone(username: username, token: token);
  }
  @override
  Future<Response<List<GetOpenTradesModel>?>?>openTradesData({String? username, String? token}) async {
    return await accountInformationService.openTradesData(username: username, token: token);
  }
}
