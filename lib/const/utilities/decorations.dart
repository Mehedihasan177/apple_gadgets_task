import 'package:flutter/material.dart';

import '../theme/color_resources.dart';

class BdjDecorations {
  static TextStyle textFieldFocusLabelTextStyle() {
    return const TextStyle(fontSize: 16.0, color: ColorResources.CORPORATE_ASH);
  }

  static TextStyle textFieldFocusErrorLabelTextStyle() {
    return const TextStyle(fontSize: 16.0, color: ColorResources.CORPORATE_RED);
  }

  static TextStyle setTextStyle(double fontSize, Color fontColor,
      String fontfamily, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontFamily: fontfamily,
        fontWeight: fontWeight);
  }

  static OutlineInputBorder textFieldFocusOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorResources.CORPORATE_BLUE, width: 2.0),
      borderRadius: BorderRadius.circular(4.0),
    );
  }

  static OutlineInputBorder textFieldErrorInputBorder() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorResources.CORPORATE_RED, width: 2.0),
      borderRadius: BorderRadius.circular(4.0),
    );
  }

  static OutlineInputBorder textFieldOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorResources.CORPORATE_ASH, width: 2.0),
      borderRadius: BorderRadius.circular(4.0),
    );
  }
}
