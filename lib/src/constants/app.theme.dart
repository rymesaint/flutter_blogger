import 'package:blogspot/src/constants/app.color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Outfit',
      primaryColor: AppColor.primaryColor,
      primaryColorDark: AppColor.primaryColor,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: Colors.grey,
      ),
      backgroundColor: AppColor.backgroundColor,
      cardColor: Colors.grey[50],
      textTheme: const TextTheme(
        headline3: TextStyle(
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primaryColor,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
      ),

      // CUSTOMIZE showDatePicker Colors
      dialogBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      highlightColor: AppColor.primaryColor.withOpacity(0.3),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primaryColor,
        selectedIconTheme: IconThemeData(
          color: AppColor.primaryColor,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColor.primaryColor,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        labelColor: Colors.white,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        unselectedLabelColor: AppColor.textColor,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(AppColor.primaryColor),
      ),
    );
  }

  //
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Outfit',
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryColor,
      primaryColorDark: AppColor.primaryColor,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: Colors.grey,
      ),
      backgroundColor: Colors.grey[850],
      cardColor: Colors.grey[700],
      errorColor: AppColor.failedColor,
      hintColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
        iconColor: Colors.white,
        filled: true,
        fillColor: Colors.black,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        subtitle2: TextStyle(
          color: Colors.white,
        ),
        headline3: TextStyle(
          color: Colors.white,
        ),
        headline6: TextStyle(
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primaryColor,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
      ),
      highlightColor: AppColor.primaryColor.withOpacity(0.3),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primaryColor,
        selectedIconTheme: IconThemeData(
          color: AppColor.primaryColor,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColor.primaryColor,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.black,
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColor.textColor,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(AppColor.primaryColor),
      ),
    );
  }
}
