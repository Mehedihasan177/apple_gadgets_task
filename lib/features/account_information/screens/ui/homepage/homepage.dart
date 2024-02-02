import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/features/account_information/data/source/account_information_service.dart';
import 'package:apple_gadgets_task/features/account_information/screens/controller/account_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends StatefulWidget {
   HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
final getInformationController = Get.put(GetAccountInformationController());

@override
  void initState() {
    getInformationController.getAccountInformation(context: context, username: session.username, token: session.token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homepage"),),
      body: GetBuilder<GetAccountInformationController>(
        initState: (state){
          
        },
        builder: (context) {
          return Text("adas");
        }
      ),
    );
  }
}