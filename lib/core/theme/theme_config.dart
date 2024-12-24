import 'package:flutter/material.dart';

// ThemeConfig class to define app-wide themes for consistent styling
class ThemeConfig {
  // Define a static theme for the dark mode theme, inspired by YouTube
  static ThemeData youtubeDarkModeTheme = ThemeData(
    // Set the overall brightness to dark
    brightness: Brightness.dark,
    // Primary color used for widgets like progress bars or active icons
    primaryColor: Color(0xFFFF325B),
    // Background color for scaffold screens
    scaffoldBackgroundColor: Color(0xFF181818),
    // Disable Material 3 styling if not ready for it
    useMaterial3: false,
    // Customize the app bar's appearance
    appBarTheme: AppBarTheme(
      color: Color(0xFF181818), // Background color for the app bar
      iconTheme:
          IconThemeData(color: Colors.white), // Icon color in the app bar
      titleTextStyle: TextStyle(
        color: Colors.white, // Title text color
        fontSize: 20, // Font size for app bar title
        fontWeight: FontWeight.bold, // Font weight for better visibility
      ),
    ),
    // Define text styles used throughout the app
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white, // Default color for medium body text
      ),
    ),
    // Customize the list tile appearance
    listTileTheme: ListTileThemeData(
      selectedColor: Color(0xFFFF325B), // Highlighted tile text color
      selectedTileColor:
          Color(0xFFFF325B).withOpacity(0.15), // Background for selected tiles
    ),
    // Default icon color for the app
    iconTheme: IconThemeData(
      color: Colors.white, // Icon color in the app
    ),
    // Deprecated ButtonTheme, used here for older buttons
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFFF325B), // Background color for buttons
      textTheme: ButtonTextTheme.primary, // Text color for buttons
    ),
    // Styling for search views (app-wide search inputs)
    searchViewTheme: SearchViewThemeData(
      elevation: 0, // Remove elevation for a flat design
      backgroundColor:
          Color(0XFF2A2A2A), // Background color for the search view
      dividerColor: Color.fromARGB(
          255, 48, 48, 48), // Divider color within the search view
    ),
    // Styling for search bars (search widgets)
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(
          Color(0xFF181818)), // Background color for search bar
      elevation: WidgetStateProperty.all<double>(0), // Remove shadow
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Rounded corners
          side: BorderSide(
            color: Color(0XFF2A2A2A), // Border color for search bar
            width: 1.5, // Border thickness
          ),
        ),
      ),
      hintStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          color: Colors.grey, // Hint text color
          fontSize: 18, // Font size for hint text
        ),
      ),
    ),
    // Customize the bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF121212), // Background color for navigation bar
      selectedItemColor: Colors.white, // Color for selected items
      unselectedItemColor: Colors.grey, // Color for unselected items
    ),
  );
}
