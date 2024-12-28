import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0), // Space between menu button and logo
      child: InkWell(
        onTap: () {}, // Action when the logo is tapped
        focusColor: Colors.transparent, // Remove focus color
        hoverColor: Colors.transparent, // Remove hover color
        child: Image.asset(
          "assets/logo.png", // Path to the logo image
          height: 100, // Logo height
          width: 100, // Logo width
          key: const Key('logo'), // Key for widget testing purposes
        ),
      ),
    );
  }
}
