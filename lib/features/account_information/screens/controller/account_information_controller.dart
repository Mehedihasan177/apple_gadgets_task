// ignore_for_file: use_build_context_synchronously
import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:apple_gadgets_task/features/account_information/data/model/account_information_model.dart';
import 'package:apple_gadgets_task/features/account_information/domain/repository/account_information_repository.dart';
import 'package:apple_gadgets_task/features/account_information/domain/usecase/account_information_pass_usecase.dart';
import 'package:get/get.dart';

class GetAccountInformationController extends GetxController {
  var showLoaderScreen = false.obs;
  var accountInformation = GetAccountInformationModel().obs;
        final AccountInformationPassUseCase accountInformationPassUseCase = AccountInformationPassUseCase(
        locator<AccountInformationRepository>(),
      );
        final DioClient _dioClient = locator<DioClient>();
  getAccountInformation({required context, String? username, String? token}) async {
    showLoaderScreen.value = true;
    try {

      var response = await accountInformationPassUseCase(username: username, token: token);

      // if (response?.data != null) {
        print("this is main data ${response?.data?.city}");
      // } else {
      //   CommonMethods.showToast('Response data is null', ColorResources.WHITE);
      // }
    } catch (e) {
      CommonMethods.showToast(e.toString(), ColorResources.WHITE);
    } finally {
      showLoaderScreen.value = false;
    }
  }
}
