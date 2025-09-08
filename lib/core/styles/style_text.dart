import 'package:flutter/material.dart';

import 'style_color.dart';

class StyleText {
  static TextStyle light(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        decoration: decorationText,
      );

  static TextStyle regular(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        decoration: decorationText,
      );

  static TextStyle regularItalic(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        decoration: decorationText,
      );

  static TextStyle medium(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        decoration: decorationText,
      );

  static TextStyle semiBold(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        decoration: decorationText,
      );

  static TextStyle bold(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        decoration: decorationText,
      );

  static TextStyle extraBold(
          {Color colorText = StyleColor.black,
          fontSize = 10.0,
          TextDecoration decorationText = TextDecoration.none}) =>
      TextStyle(
        fontFamily: 'Poppins',
        color: colorText,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        decoration: decorationText,
      );
}
