import 'package:flutter/material.dart';

class AppFont {

  static TextStyle signature({Color? color, double? fontSize, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'Autography',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle bold({Color? color, double? fontSize, TextDecoration? decoration, List<Shadow>? shadows}) {
    return TextStyle(
      fontFamily: 'SpaceGrotesk-Bold',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
      shadows: shadows
    );
  }

  static TextStyle light({Color? color, double? fontSize, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'SpaceGrotesk-Light',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle medium({Color? color, double? fontSize, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'SpaceGrotesk-Medium',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle regular({Color? color, double? fontSize, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'SpaceGrotesk-Regular',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle semiBold({Color? color, double? fontSize, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'SpaceGrotesk-SemiBold',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }
}
