import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class UserCatchController extends GetxController {
  var userName = ''.obs;
  var password;
  var token = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getValue();
    // storeValue(mobile, password);
  }

  storeValue(username, token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("username", username);
    prefs.setString("token", token);
  }

  getValue() async {
    final SharedPreferences prefs = await _prefs;
    prefs.getString("username");
    prefs.getString("token");
    userName.value = prefs.getString("username") ?? '';
    token.value = prefs.getString("token") ?? '';
    print("mobile");
    print(token);
  }
}
