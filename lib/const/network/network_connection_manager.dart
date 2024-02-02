import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
final logger = Logger();
class GetXConnectionController extends GetxController {
  var connectionType = 1.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateState);
    super.onInit();
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = (await connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      logger.e(e.toString());
    }
    return updateState(connectivityResult);
  }

  updateState(ConnectivityResult result) {
    if (ConnectivityResult.none == result) {
      connectionType.value = 0;
    }
  }
}
