import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/features/account_information/data/repository/account_information_repository_impl.dart';
import 'package:apple_gadgets_task/features/account_information/data/source/account_information_service.dart';
import 'package:apple_gadgets_task/features/account_information/domain/repository/account_information_repository.dart';
import 'package:apple_gadgets_task/features/account_information/screens/controller/account_information_controller.dart';
import 'package:apple_gadgets_task/features/login/data/repository/login_repository_impl.dart';
import 'package:apple_gadgets_task/features/login/data/source/login_service.dart';
import 'package:apple_gadgets_task/features/login/domain/repository/login_repository.dart';
import 'package:apple_gadgets_task/features/login/screens/controller/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<Dio>(
      () => Dio()..interceptors.add(InterceptorsWrapper()));

  locator.registerFactory<SignInController>(() => Get.put(SignInController()));
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));
  locator.registerFactory<SignInService>(() => SignInService());
  locator.registerFactory<SignInRepository>(
      () => SignInRepositoryImpl(locator<SignInService>()));


  ///get account information    
      // locator.registerFactory<GetAccountInformationController>(() => Get.put(GetAccountInformationController()));
  locator.registerFactory<AccountInformationService>(() => AccountInformationService());
  locator.registerFactory<AccountInformationRepository>(
      () => AccountInformationImpl(locator<AccountInformationService>()));

  locator.registerSingletonAsync<SessionManager>(() async =>
      SessionManager(PrefManager(await SharedPreferences.getInstance())));
}
