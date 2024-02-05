import 'package:apple_gadgets_task/const/model/api_response.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/get_open_trades_model.dart';

import '../../data/model/account_information_model.dart';
import 'account_information_usecase.dart';

class AccountInformationPassUseCase extends AccountInformationUseCase {
  AccountInformationPassUseCase(super.accountInformationRepository);

  Future<Response<GetAccountInformationModel?>?> call({String? username, String? token}) async {
    return await accountInformationRepository.accountInformationPass(username: username, token: token);
  }
  
}
class GetLastFourNumbersPhone extends AccountInformationUseCase {
  GetLastFourNumbersPhone(super.accountInformationRepository);

Future<Response<dynamic?>?> call({String? username, String? token}) async {
    return await accountInformationRepository.lastFourDigitFromPhone(username: username, token: token);
  }
}
class GetopenTradesData extends AccountInformationUseCase {
  GetopenTradesData(super.accountInformationRepository);

Future<Response<List<GetOpenTradesModel>?>?> call({String? username, String? token}) async {
    return await accountInformationRepository.openTradesData(username: username, token: token);
  }
}
