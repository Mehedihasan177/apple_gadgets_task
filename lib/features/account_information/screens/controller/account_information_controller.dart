// ignore_for_file: use_build_context_synchronously
import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/account_information_model.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/get_open_trades_model.dart';
import 'package:apple_gadgets_task/features/account_information/domain/repository/account_information_repository.dart';
import 'package:apple_gadgets_task/features/account_information/domain/usecase/account_information_pass_usecase.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class GetAccountInformationController extends GetxController {
  var isShowLoaderScreen = false.obs;
  var isPhoneNumberLoading = false.obs;
  var isOpenTradesDataLoading = false.obs;
  RxList<GetOpenTradesModel> openTradeData = <GetOpenTradesModel>[].obs;
  var mobileLastFourNumber = ''.obs;
  final accountInformation = GetAccountInformationModel().obs;
      final accountInfromation =
        AccountInformationPassUseCase(locator<AccountInformationRepository>());
      final lastFourDigitFromPhone =
        GetLastFourNumbersPhone(locator<AccountInformationRepository>());
      final openTradesData =
        GetopenTradesData(locator<AccountInformationRepository>());
getAccountInformation(BuildContext context) async {
  isShowLoaderScreen.value = true;
accountInformation.value = GetAccountInformationModel();
  try {
    var response = await accountInfromation(username: session.username, token: session.token);

    if(response?.data != null){
      accountInformation.value = response?.data ?? GetAccountInformationModel();
      print(accountInformation.value.address);
    }else{
      CommonMethods.showToast("Data not Found");
    }
  }finally{
    isShowLoaderScreen.value = false;
  }
}
getOpenTrades(BuildContext context) async {
  isOpenTradesDataLoading.value = true;
openTradeData.clear();
  try {
    var response = await openTradesData(username: session.username, token: session.token);
    print(response?.data);
if(response?.data != null){
  openTradeData.value = response?.data ?? <GetOpenTradesModel>[].obs;
  print(openTradeData.first.openPrice);
}else{
  print("data not come");
  CommonMethods.showToast("Data not Found");
}
  }finally{
    isOpenTradesDataLoading.value = false;
  }

}

getLastFourNumbersPhone(BuildContext context) async {
  isPhoneNumberLoading.value = true;
mobileLastFourNumber.value = '';
  try {
    var response = await lastFourDigitFromPhone(username: session.username, token: session.token);
    if(response?.data != null){
      mobileLastFourNumber.value = response?.data;
    }
  } catch (e, stackTrace) {
    CommonMethods.showToast("${e.toString()}");
    print("Exception: $e\n$stackTrace");
  }finally{
    isPhoneNumberLoading.value = false;
  }
}
}
