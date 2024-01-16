import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 28.fSize,
          fontFamily: 'Proxima Nova Alt',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 22.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF8982FF),
    primaryContainer: Color(0XFFEB001B),
    secondaryContainer: Color(0XFFB5B5BF),

    // Error colors
    errorContainer: Color(0XFFE50913),
    onError: Color(0X5B2472D5),

    // On colors(text colors)
    onPrimary: Color(0XFF0E0E11),
    onPrimaryContainer: Color(0XFF020020),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber600 => Color(0XFFFFB700);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blueA700 => Color(0XFF0063F5);
  Color get blueA70001 => Color(0XFF005CFF);
  Color get blueA70066 => Color(0X660062F5);

  // Gray
  Color get gray100 => Color(0XFFF4F4F5);
  Color get gray200 => Color(0XFFE9E9EC);
  Color get gray300 => Color(0XFFDADADF);
  Color get gray500 => Color(0XFF9494A2);
  Color get gray700 => Color(0XFF656574);

  // Green
  Color get green600 => Color(0XFF359766);
  Color get greenA70026 => Color(0X261DD75F);

  // Indigo
  Color get indigo100 => Color(0XFFCCD6EB);
  Color get indigo50 => Color(0XFFDCDAFF);
  Color get indigoA400 => Color(0XFF4C42FF);

  // LightBlue
  Color get lightBlue500 => Color(0XFF00AFF0);
  Color get lightBlue800 => Color(0XFF0274B3);

  // Pink
  Color get pink400 => Color(0XFFE84C88);

  // Red
  Color get red700 => Color(0XFFD13329);
  Color get redA70026 => Color(0X26E50812);

  // Teal
  Color get teal800 => Color(0XFF007348);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
