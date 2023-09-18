import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CusColors {
  static Color black100 = const Color(0xff1B262E);
  static Color black90 = const Color(0xff354349);
  static Color black60 = const Color(0xff606D76);
  static Color black45 = const Color(0xffA9B4BC);
  static Color black20 = const Color(0xffC5CDD2);
  static Color black10 = const Color(0xffE7ECF0);
  static Color black1 = const Color(0xffF8F9FB);
  static Color grey = const Color(0xff8891A5);
  static Color greyLite = const Color(0xffFAFBFD);
  static Color navigatorbar = const Color(0xFFF8F7FB);
}

class AppColors {
  static Color blue = const Color(0xff2A4BA0);
  static Color blueDark = const Color(0xff153075);
  static Color orange = const Color(0xffF9B023);
  static Color orangeLite = const Color(0xffFFC83A);
  static Color textFieldColor = const Color(0xff153075);
}

class CustomStyle {
  static TextStyle headerBold = const TextStyle(
    // For 30 Size
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(0xffFAFBFD),
  );
  static TextStyle subheader = const TextStyle(
    // For 30 Size
    fontWeight: FontWeight.bold,
    color: Color(0xffFAFBFD),
  );

  static TextStyle buttontext = TextStyle(
    color: CusColors.black10,
  );

  static TextStyle labeltext = TextStyle(color: Color(0xFFB2BBCE));
}
