import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/get_open_trades_model.dart';

import '../../data/model/account_information_model.dart';
import '../../data/source/account_information_service.dart';

abstract class AccountInformationRepository {
  final AccountInformationService accountInformationService;

  AccountInformationRepository(this.accountInformationService);

  Future<Response<GetAccountInformationModel?>?> accountInformationPass({String? username, String? token});
  Future<Response<dynamic?>?> lastFourDigitFromPhone({String? username, String? token});
  Future<Response<List<GetOpenTradesModel>?>?> openTradesData({String? username, String? token});

}
