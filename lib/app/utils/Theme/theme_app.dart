import 'package:app_dual_theme/app/utils/colors/app_colosrs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeAppProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeAppProvider({required this.isLightTheme});

  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColorsTheme.navColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isLightTheme) {
      sharedPreferences.setBool(SPref.isLight, false);
      isLightTheme = !isLightTheme;
      notifyListeners();
    } else {
      sharedPreferences.setBool(SPref.isLight, true);
      isLightTheme = !isLightTheme;
      notifyListeners();
    }
    getCurrentStatusNavigationBarColor();
    notifyListeners();
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
          isLightTheme ? AppColorsTheme.yellow : AppColorsTheme.black,
      textTheme: TextTheme(
        headline1: GoogleFonts.stickNoBills(
          fontSize: 70,
          fontWeight: FontWeight.w600,
          color: isLightTheme ? AppColorsTheme.black : AppColorsTheme.orange,
        ),
        headline2: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w500,
          color: isLightTheme ? AppColorsTheme.black : AppColorsTheme.orange,
        ),
      ),
    );
  }

  ThemeMode themeMode() {
    return ThemeMode(
      gradientColors: isLightTheme
          ? [AppColorsTheme.yellow, AppColorsTheme.yellowDark]
          : [AppColorsTheme.black, AppColorsTheme.black],
      switchColor: isLightTheme ? AppColorsTheme.black : AppColorsTheme.orange,
      thumbColor: isLightTheme ? AppColorsTheme.orange : AppColorsTheme.black,
      switchBgColor: isLightTheme
          ? AppColorsTheme.black.withOpacity(.1)
          : AppColorsTheme.grey.withOpacity(.3),
    );
  }
}

class ThemeMode {
  List<Color>? gradientColors;
  Color? switchColor;
  Color? thumbColor;
  Color? switchBgColor;

  ThemeMode({
    this.gradientColors,
    this.switchColor,
    this.thumbColor,
    this.switchBgColor,
  });
}
