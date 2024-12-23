import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData youtubeDarkModeTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.redAccent,
    scaffoldBackgroundColor: Color(0xFF181818),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      color: Color(0xFF181818),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.redAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    
    searchViewTheme: SearchViewThemeData(
      elevation: 0,
      backgroundColor: Color(0XFF2A2A2A),
      dividerColor: Color.fromARGB(255, 48, 48, 48),
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(Color(0xFF181818)),
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: Color(0XFF2A2A2A),
            width: 1.5,
          ),
        ),
      ),
      hintStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF121212),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
  );
}
