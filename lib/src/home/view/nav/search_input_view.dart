import 'package:flutter/material.dart';
import '../../../../core/view/widget/custom_icon_button.dart'; // Custom reusable icon button widget

/// A reusable search input widget with a customizable search bar
class SearchInputView extends StatelessWidget {
  const SearchInputView(
      {super.key}); // Constructor with a key for widget identity

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      // Builder for creating the search bar
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller, // Controller to manage search state
          leading: CustomIconButton(
            onTap: () {
              controller.openView();
            }, // Define action for the leading search icon
            icon: Icons.search_rounded, // Use a rounded search icon
          ),
          onTap: () => controller.openView(), // Open search view when tapped
          hintText: "Search", // Placeholder text inside the search bar
          trailing: [
            // Add a microphone button for voice search functionality
            CustomIconButton(
              onTap: () {}, // Define action for the microphone button
              icon: Icons.mic_rounded, // Microphone icon for voice search
            ),
          ],
        );
      },
      // Suggestions builder for displaying search suggestions
      suggestionsBuilder: (context, controller) {
        return []; // Currently returns an empty list of suggestions
      },
    );
  }
}
