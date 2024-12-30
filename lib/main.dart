import 'package:flutter/material.dart'; // Core Flutter widgets
import 'package:flutter_riverpod/flutter_riverpod.dart'; // State management with Riverpod
import 'package:responsive_builder/responsive_builder.dart'; // Utilities for responsive design

import 'core/theme/theme_config.dart'; // Custom theme configuration
import 'core/view/screen/home_screen.dart'; // Home screen widget

// Entry point of the application
void main() {
  // Ensure widgets are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Wrap the app with DevicePreview to enable device simulations
    const ProviderScope(
      // Provide the Riverpod scope for state management
      child: MainApp(),
    ),
  );
}

// Main application widget
class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Constructor with a key for widget identity

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true, // Prefer desktop layout if applicable
      builder: (_) => MaterialApp(
        // Use the dark mode theme from ThemeConfig
        theme: ThemeConfig.youtubeDarkModeTheme,
        home: HomeScreen(), // Set HomeScreen as the default screen
      ),
    );
  }
}
