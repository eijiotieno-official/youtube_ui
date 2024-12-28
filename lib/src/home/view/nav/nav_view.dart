import 'package:flutter/material.dart'; // Core Flutter package for UI
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod for state management
import 'package:youtube_ui/src/home/view/nav/logo_view.dart';

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
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Efficient way to space out the widgets
          children: [
            // Menu button on the left
            CustomIconButton(
              onTap: () {}, // Define the action for the menu button
              icon: Icons.menu_rounded, // Icon for the menu button
            ),
            // Logo placed after the menu button
            LogoView(),
            Spacer(),
            // Search bar widget in the center
            const SearchInputView(),
            Spacer(),
            // Action buttons on the right side of the navigation bar
            const ActionButtonsView(),
          ],
        ),
      ),
    );
  }
}
