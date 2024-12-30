import 'package:flutter/material.dart';

// A widget representing a single category item, which can be selected or deselected.
class CategoryItem extends StatelessWidget {
  final bool isSelected; // Indicates whether the item is selected.
  final String category; // The name of the category to display.
  final VoidCallback
      onTap; // Callback function triggered when the item is tapped.

  const CategoryItem({
    super.key,
    required this.category, // Ensures the category is provided.
    required this.onTap, // Ensures the onTap function is provided.
    required this.isSelected, // Ensures the selection state is provided.
  });

  @override
  Widget build(BuildContext context) {
    // Access the current theme for styling purposes.
    final theme = Theme.of(context);

    // Define a consistent border radius for the container.
    final borderRadius = BorderRadius.circular(10.0);

    // Determine the background color based on the selection state.
    final color = isSelected
        ? theme.primaryColor.withOpacity(0.75) // Highlight if selected.
        : theme.hoverColor; // Default color if not selected.

    return Padding(
      // Add spacing between this item and others.
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        // Handle taps to update the selected category.
        onTap: onTap,
        borderRadius: borderRadius, // Match the border radius of the container.
        child: Container(
          // Box decoration for styling the container.
          decoration: BoxDecoration(
            color: color, // Set the background color.
            borderRadius: borderRadius, // Apply rounded corners.
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0, // Add horizontal padding inside the container.
          ),
          child: Center(
            // Center the category text within the container.
            child: Text(
              category, // Display the category name.
              style: const TextStyle(
                fontSize: 16.0, // Set the font size for the text.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
