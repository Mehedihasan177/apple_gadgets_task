// ignore_for_file: unnecessary_null_comparison

import 'package:apple_gadgets_task/const/extensions/extensions.dart';
import 'package:apple_gadgets_task/const/source/pref_manager.dart';
import 'package:apple_gadgets_task/const/utilities/common_methods.dart';
import 'package:apple_gadgets_task/const/utilities/decorations.dart';
import 'package:apple_gadgets_task/features/account_information/screens/controller/account_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomepageScreen extends StatefulWidget {
  HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final getInformationController = Get.put(GetAccountInformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        actions: [
          IconButton(onPressed: (){
            session.logout(context);
          }, icon: Icon(Icons.logout, size: 26,))
        ],
      ),
      body: GetBuilder<GetAccountInformationController>(initState: (state) {
        getInformationController.getAccountInformation(context);
        getInformationController.getLastFourNumbersPhone(context);
        getInformationController.getOpenTrades(context);
      }, builder: (_) {
        return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                children: [
                getInformationController.isShowLoaderScreen.value? Center(
                  child: CircularProgressIndicator(),
                ) : getInformationController
                                  .accountInformation.value == null ? Center(child: CircularProgressIndicator(),) : Row(
                    children: [
                      Icon(
                        Icons.person_pin,
                        size: 80,
                      ),
                      SizedBox(
                        // height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRow(
                              title: "Address:",
                              data: getInformationController
                                  .accountInformation.value.address
                                  .toString(),
                            ),
                            CustomRow(
                              title: "Country:",
                              data: getInformationController
                                  .accountInformation.value.country
                                  .toString(),
                            ),
                            CustomRow(
                              title: "Phone No:",
                              data: getInformationController
                                  .mobileLastFourNumber.value
                                  .toString(),
                            ),
                            CustomRow(
                              title: "Balance:",
                              data: getInformationController
                                  .accountInformation.value.balance
                                  .toString(),
                            ),
                            CustomRow(
                              title: "Current Transaction:",
                              data: getInformationController
                                  .accountInformation.value.currentTradesCount
                                  .toString(),
                            ),
                            CustomRow(
                              title: "Total Trades:",
                              data: getInformationController
                                  .accountInformation.value.totalTradesCount
                                  .toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  10.ph,
                  Expanded(
                      child: getInformationController
                              .isOpenTradesDataLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : getInformationController.openTradeData.isEmpty
                              ? CommonMethods.notFound()
                              : RefreshIndicator(
                          onRefresh: () async {
                            getInformationController.getOpenTrades(context);
                          },
                                child: ListView.builder(
                                    itemCount: getInformationController
                                        .openTradeData.length,
                                    itemBuilder: (_, index) {
                                      var item = getInformationController
                                          .openTradeData[index];
                                      var value = 0.0; 
                                      value = value + double.parse(item.profit); 
                                      
                                      return index == 0
                                          ? Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  HeaderTitleWidget(
                                                      title: "Total Profit"),
                                                  HeaderTitleWidget(
                                                      title: "$value"),
                                                ],
                                              ),
                                          )
                                          : Card(
                                              shape: BeveledRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: HeaderTitleWidget(
                                                                title:
                                                                    "Current Price")),
                                                        Expanded(
                                                            child: HeaderTitleWidget(
                                                                title:
                                                                    "Open Price")),
                                                        Expanded(
                                                            child:
                                                                HeaderTitleWidget(
                                                                    title:
                                                                        "Profit")),
                                                        Expanded(
                                                            child: HeaderTitleWidget(
                                                                title:
                                                                    "Open Time")),
                                                      ],
                                                    ),
                                                    10.ph,
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: DataWidget(
                                                                title: (item.currentPrice)
                                                                        ?.toStringAsFixed(
                                                                            2) ??
                                                                    '')),
                                                        Expanded(
                                                            child: DataWidget(
                                                                title: (item.openPrice)
                                                                        ?.toStringAsFixed(
                                                                            2) ??
                                                                    '')),
                                                        Expanded(
                                                            child: DataWidget(
                                                                title: double.parse(
                                                                        item.profit)
                                                                    .toStringAsFixed(
                                                                        2))),
                                                        Expanded(
                                                            child: DataWidget(
                                                                title: DateFormat(
                                                                        'yyyy/MM/dd')
                                                                    .format(item
                                                                        .openTime))),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                    }),
                              ))
                ],
              ),
        ));
      }),
    );
  }

  Widget HeaderTitleWidget({required String title}) {
    return Center(
        child: Text(
      title,
      style: BdjDecorations.setTextStyle(
          16.0, Colors.black, "Roboto", FontWeight.bold),
    ));
  }

  Widget DataWidget({required String title}) {
    return Center(
        child: Text(
      title,
      style: BdjDecorations.setTextStyle(
          12.0, Colors.black, "Roboto", FontWeight.normal),
    ));
  }

  Widget CustomRow({required String title, required String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: BdjDecorations.setTextStyle(
              14.0, Colors.black, "Roboto", FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          data,
          style: BdjDecorations.setTextStyle(
              14.0, Colors.black, "Roboto", FontWeight.normal),
        ),
      ],
    );
  }
  // Future<Translation> translate(String? text)async{

  // // final input = "Здравствуйте. Ты в порядке?";

  // translator.translate(text ?? '', from: 'tat', to: 'en').then(print);
  // // prints Hello. Are you okay?

  // var translation = await translator.translate("Dart is very cool!", to: 'pl');
  // return translation;
  // }
}
