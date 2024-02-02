import 'package:apple_gadgets_task/const/network/configuration.dart';


class BaseResponse {
  int status = ApiConfiguration.connectionError;

  int get getStatusCode => status;
}
