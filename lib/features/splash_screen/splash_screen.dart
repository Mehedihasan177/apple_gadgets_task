
import 'package:apple_gadgets_task/const/utilities/assets_path.dart';
import 'package:apple_gadgets_task/features/login/screens/controller/login_controller.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SignInController _loginController = SignInController();
  @override
  void didChangeDependencies() {
Future.delayed(const Duration(seconds: 2), (){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loginController.checkLoginStatus(context);
    });
});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Expanded(
              flex: 9,
              child: Center(
                child: Image.asset(AssetsPath.logo, height: 200, width: 200,)
              ),
            ),
            const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
