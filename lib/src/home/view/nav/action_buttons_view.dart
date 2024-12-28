import 'package:flutter/material.dart';
import '../../../../core/view/widget/custom_icon_button.dart'; // Custom reusable icon button widget

/// A widget displaying a row of action buttons and a profile avatar
class ActionButtonsView extends StatelessWidget {
  const ActionButtonsView(
      {super.key}); // Constructor with a key for widget identity

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:
          MainAxisSize.min, // Keep the row size minimal to fit its content
      children: [
        // Add Content button
        CustomIconButton(
          onTap: () {}, // Define the action for the add content button
          icon: Icons.add_circle_outline_outlined, // Icon for add content
        ),
        // Notifications button
        CustomIconButton(
          onTap: () {}, // Define the action for the notifications button
          icon: Icons.notifications_none_rounded, // Icon for notifications
        ),
        // Settings button
        CustomIconButton(
          onTap: () {}, // Define the action for the settings button
          icon: Icons.settings_outlined, // Icon for settings
        ),
        // Profile avatar with padding for spacing
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0), // Add spacing before the avatar
          child: InkWell(
            onTap: () {}, // Define the action for the avatar tap
            borderRadius: BorderRadius.circular(
                50), // Circular border for the ripple effect
            child: CircleAvatar(
              radius: 15, // Size of the avatar
              backgroundImage: AssetImage(
                'assets/profile.png', // Path to the profile image
              ),
            ),
          ),
        ),
      ],
    );
  }
}
