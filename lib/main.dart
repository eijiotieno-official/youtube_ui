import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'core/theme/theme_config.dart';
import 'core/view/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MainApp()),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (_) => MaterialApp(
        theme: ThemeConfig.youtubeDarkModeTheme,
        home: HomeScreen(),
      ),
    );
  }
}
