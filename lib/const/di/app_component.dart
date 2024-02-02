import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:apple_gadgets_task/const/source/dio_client.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/features/login/data/repository/login_repository_impl.dart';
import 'package:apple_gadgets_task/features/login/data/source/login_service.dart';
import 'package:apple_gadgets_task/features/login/domain/repository/login_repository.dart';
import 'package:apple_gadgets_task/features/login/screens/controller/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/configuration.dart';
import '../network/network_connection_manager.dart';


final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<Dio>(() => Dio()
    ..interceptors.add(InterceptorsWrapper()));

  locator.registerFactory<SignInController>(() => Get.put(SignInController()));
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));
  locator.registerFactory<SignInService>(() => SignInService());
  locator.registerFactory<SignInRepository>(
      () => SignInRepositoryImpl(locator<SignInService>()));

  locator.registerSingletonAsync<SessionManager>(() async =>
      SessionManager(PrefManager(await SharedPreferences.getInstance())));
}
