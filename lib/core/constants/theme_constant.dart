import 'package:flutter/material.dart';

import '../config/app_config.dart';

class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogBackgroundColor: Colors.white,
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      primaryColor: appThemeColors!.primary,
      primarySwatch: Colors.grey,
      primaryColorDark: Colors.green,
      primaryColorLight: Colors.white,
      fontFamily: appThemeHeadlineFont,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: appThemeColors!.bg,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            fontFamily: appThemeSubtitleFont,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: appThemeColors!.primary)),
    );
  }
}

double getDeviceHight(context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(context) {
  return MediaQuery.of(context).size.width;
}

class TitleHelper {
  static var h1 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h1,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
    // fontWeight: FontWeight.w600
  );
  static var h1Second = TextStyle(
    fontSize: appThemeHeadlineSizes!.h2,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,

    fontFamily: appThemeHeadlineFont,
    // fontWeight: FontWeight.w600
  );

  static var h2 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h2,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h3 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h3,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h4 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h4,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h5 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h5,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h6 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h6,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h7 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h7,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h8 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h8,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h9 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h9,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h10 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h10,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h11 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h11,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
  static var h12 = TextStyle(
    fontSize: appThemeHeadlineSizes!.h12,
    color: appThemeColors!.primary,
    fontWeight: appThemeHeadlineIsBold ? FontWeight.w600 : null,
    fontFamily: appThemeHeadlineFont,
  );
}

class SubtitleHelper {
  static var h1 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h1,
    color: appThemeColors!.textDark,

    fontFamily: appThemeSubtitleFont,
    // fontWeight: FontWeight.w600
  );
  static var h1Second = TextStyle(
    fontSize: appThemeSubtitleSizes!.h2,
    color: appThemeColors!.textDark,

    fontFamily: appThemeSubtitleFont,
    // fontWeight: FontWeight.w600
  );

  static var h2 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h2,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h3 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h3,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h4 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h4,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h5 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h5,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h6 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h6,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h7 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h7,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h8 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h8,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h9 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h9,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h10 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h10,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h11 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h11,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
  static var h12 = TextStyle(
    fontSize: appThemeSubtitleSizes!.h12,
    color: appThemeColors!.textDark,
    fontFamily: appThemeSubtitleFont,
  );
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
