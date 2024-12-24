import 'package:flutter/material.dart'; // Core Flutter package for UI
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod for state management

import '../../../../core/view/widget/custom_icon_button.dart'; // Custom reusable icon button widget
import 'action_buttons_view.dart'; // Widget for action buttons
import 'search_input_view.dart'; // Widget for the search input field

// NavView represents the navigation bar section of the app
class NavView extends ConsumerWidget {
  const NavView({super.key}); // Constructor with a key for widget identity

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width:
          double.infinity, // Make the navigation bar stretch across the screen
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Horizontal padding for the bar
        child: Row(
          children: [
            // Menu button on the left
            CustomIconButton(
              onTap: () {}, // Define the action for the menu button
              icon: Icons.menu_rounded, // Icon for the menu button
            ),
            // Logo placed after the menu button
            Padding(
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
            ),
            // Spacer to push content apart
            Spacer(),
            // Search bar widget in the center
            SearchInputView(),
            // Spacer to balance the layout
            Spacer(),
            // Action buttons on the right side of the navigation bar
            ActionButtonsView(),
          ],
        ),
      ),
    );
  }
}
