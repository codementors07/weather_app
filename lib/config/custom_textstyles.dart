import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle customTextStyle(
      {required double fontSize,
      required FontWeight fontWeight,
      required Color textColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        decoration: textDecoration);
  }

  static TextStyle largeTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? textColor,
      TextDecoration? textDecoration}) {
    return customTextStyle(
        fontSize: fontSize ?? 28,
        fontWeight: fontWeight ?? FontWeight.w600,
        textColor: textColor ?? Colors.white,
        textDecoration: textDecoration);
  }

  static TextStyle semilargeTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? textColor,
      TextDecoration? textDecoration}) {
    return customTextStyle(
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.w600,
        textColor: textColor ?? Colors.white,
        textDecoration: textDecoration);
  }
}
