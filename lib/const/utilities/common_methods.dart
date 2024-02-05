import 'dart:core';
import 'dart:ui' as ui;
import 'package:apple_gadgets_task/const/extensions/extensions.dart';
import 'package:apple_gadgets_task/const/route/router.dart';
import 'package:apple_gadgets_task/const/theme/color_resources.dart';
import 'package:apple_gadgets_task/const/utilities/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonMethods {
  static Widget loaderScreen() {
    return const AbsorbPointer(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void showDraftedJobReadyToProcessError({
    required BuildContext context,
    required String errorType,
    required String msgWarning,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: 420,
              padding: const EdgeInsets.only(
                top: 40,
                left: 40,
                right: 40,
                bottom: 40,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorResources.CORPORATE_BLUE,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              RouteGenerator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 64,
                            width: 64,
                            child: SvgPicture.asset(
                              AssetsPath.WARNING_IMAGE,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          msgWarning,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              color: ColorResources
                                  .CORPORATE_DEADLINE_JOBS_POSITION_NAME,
                              fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Wrap(
                            runSpacing: 8.0,
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF2F2F2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Call',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF2F2F2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    RouteGenerator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorResources.CORPORATE_ASH_TEXT,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget notFound() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorResources.WHITE,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AssetsPath.NOT_FOUND_IMAGE,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(right: 22),
            child: const Text(
              "No applicant found",
              textDirection: ui.TextDirection.ltr,
              style: TextStyle(
                color: ColorResources.CORPORATE_BLUE,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget notFoundArc({
    String title = "No applicant found",
  }) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorResources.WHITE,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              AssetsPath.NOT_FOUND_IMAGE,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(right: 22),
              child: Text(
                title,
                textDirection: ui.TextDirection.ltr,
                style: const TextStyle(
                  color: ColorResources.CORPORATE_BLUE,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// adtype = 0 = Basic Jobs
  /// adtype = 1 = Stand Out Jobs
  /// adtype = 2 = Stand Out Premium Jobs

  static showToast(String message, [color = ColorResources.WHITE]) {
    Fluttertoast.showToast(
      msg: message,
      textColor: color,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey.withOpacity(0.5),
    );
  }

  static showMessage(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
      ),
    );
  }

  static showAlertDialog(
      {required context, required String title, required String message}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Widget noInternetConnectionScreen({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.NO_INTERNET_SVG),
            25.ph,
            ElevatedButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: onPressed,
              child: const Text(
                "Try Again",
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
