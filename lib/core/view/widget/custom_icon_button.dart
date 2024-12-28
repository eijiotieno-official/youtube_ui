import 'package:flutter/material.dart';

/// A reusable custom icon button widget
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap; // Callback function triggered on button tap
  final IconData icon; // Icon to display within the button
  final double iconSize; // Icon size (optional for customization)
  final Color? iconColor; // Icon color (optional for customization)

  const CustomIconButton({
    super.key,
    required this.onTap, // Required callback for the tap event
    required this.icon, // Required icon data
    this.iconSize = 24.0, // Default icon size
    this.iconColor, // Optional icon color, falls back to theme color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Trigger the callback when tapped
      borderRadius:
          BorderRadius.circular(50), // Circular border radius for ripple effect
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // Padding around the icon for better touch area
        child: Icon(
          icon, // Display the passed icon
          size: iconSize, // Use the custom icon size
          color: iconColor ??
              Theme.of(context)
                  .iconTheme
                  .color, // Use custom or theme icon color
        ),
      ),
    );
  }
}
