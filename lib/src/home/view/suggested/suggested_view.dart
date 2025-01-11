import 'package:flutter/material.dart';

import '../../../../core/database/video_database.dart';
import '../../../../core/model/video_model.dart';
import '../../../../core/view/widget/video_item_view.dart';

class SuggestedView extends StatelessWidget {
  const SuggestedView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch a list of video models (mock data or database call for videos).
    List<VideoModel> items = VideoDatabase.getVideos(count: 4);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24.0, // Bottom padding for spacing.
        top: 8.0, // Top padding for spacing.
      ),
      child: Container(
        width: double.infinity, // Container will take the full width.
        height: 400, // Fixed height for the container.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0), // Rounded corners.
          border: Border.all(
            color: Color(0XFFB082FF), // Border color.
            width: 0.3, // Border width.
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Padding inside the container.
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft, // Align title to the left.
                    child: Text(
                      "Suggestions based on recent watches", // Title of the section.
                      style: TextStyle(
                        fontSize: 24.0, // Set the font size for the title.
                      ),
                    ),
                  ),
                  Spacer(), // Spacer to push the buttons to the right.
                  // Button: "Not interested"
                  _buildButtons(
                    color: Theme.of(context)
                        .hoverColor, // Background color from theme.
                    label: "Not interested", // Button label.
                    icon: Icon(Icons.close_rounded), // Close icon.
                  ),
                  SizedBox(width: 16), // Space between buttons.
                  // Button: "Show me more"
                  _buildButtons(
                    color: Color(0XFFB082FF)
                        .withOpacity(0.15), // Lightened background color.
                    label: "Show me more", // Button label.
                    icon: Icon(Icons.thumb_up_outlined), // Like icon.
                  ),
                ],
              ),
              // Expanded widget ensures that the video items take up the remaining space.
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Even spacing between items.
                  spacing: 24.0, // Space between individual items.
                  children: List.generate(
                    items.length, // Generate a widget for each video item.
                    (index) {
                      return Flexible(
                        child: VideoItemView(
                            video: items[index]), // Display each video.
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a button with an icon and label.
  Widget _buildButtons({
    required Color color,
    required String label,
    required Icon icon,
  }) {
    return InkWell(
      onTap: () {}, // Action when the button is tapped (empty in this case).
      borderRadius:
          BorderRadius.circular(24.0), // Rounded corners for the button.
      child: Container(
        decoration: BoxDecoration(
          color: color, // Background color for the button.
          borderRadius: BorderRadius.circular(24.0), // Rounded corners.
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0, // Horizontal padding inside the button.
            vertical: 6.0, // Vertical padding inside the button.
          ),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Minimize the row width to fit content.
            children: [
              icon, // Icon for the button.
              SizedBox(width: 5), // Space between icon and label.
              Text(label), // Button label.
            ],
          ),
        ),
      ),
    );
  }
}
