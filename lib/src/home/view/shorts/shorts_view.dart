import 'package:flutter/material.dart';

import '../../../../core/database/video_database.dart';
import '../../../../core/model/video_model.dart';
import '../../../../core/view/widget/video_item_view.dart';

// A StatelessWidget for displaying a list of "Shorts" videos in a styled container.
class ShortsView extends StatelessWidget {
  const ShortsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch a list of 6 video items marked as "shorts" from the video database.
    List<VideoModel> items = VideoDatabase.getVideos(
      count: 6,
      isShorts: true,
    );

    return Padding(
      // Add padding to the top and bottom of the widget for spacing.
      padding: const EdgeInsets.only(
        bottom: 24.0,
        top: 8.0,
      ),
      child: Container(
        // Container takes the full available width and has a fixed height of 700.
        width: double.infinity,
        height: 700,
        decoration: BoxDecoration(
          // Add rounded corners to the container.
          borderRadius: BorderRadius.circular(24.0),
          // Add a light border with a custom color.
          border: Border.all(
            color: Color(0XFF82BFFF),
            width: 0.3,
          ),
        ),
        child: Padding(
          // Add padding inside the container for internal spacing.
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // Arrange children vertically.
            children: [
              Row(
                // A row containing the title and action buttons.
                children: [
                  Icon(
                      Icons.auto_graph_outlined), // Icon for the title section.
                  SizedBox(width: 5), // Space between the icon and text.
                  Align(
                    alignment: Alignment.centerLeft, // Align title to the left.
                    child: Text(
                      "Shorts", // Title text.
                      style: TextStyle(
                        fontSize: 24.0, // Font size for the title.
                      ),
                    ),
                  ),
                  Spacer(), // Push the action buttons to the end of the row.
                  _buildButtons(
                    // Button for marking "Not interested."
                    color: Theme.of(context).hoverColor,
                    label: "Not interested",
                    icon: Icon(Icons.close_rounded),
                  ),
                  SizedBox(width: 16), // Space between the two buttons.
                  _buildButtons(
                    // Button for "Show me more."
                    color: Color(0XFFB082FF).withOpacity(0.15),
                    label: "Show me more",
                    icon: Icon(Icons.thumb_up_outlined),
                  ),
                ],
              ),
              Expanded(
                // The list of video items takes up the remaining vertical space.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Distribute items evenly.
                  spacing: 24.0, // Space between items in the row.
                  children: List.generate(
                    // Create widgets dynamically for each video in the list.
                    items.length,
                    (index) {
                      return Flexible(
                        // Each video item is wrapped in a Flexible widget for resizing.
                        child:
                            VideoItemView(video: items[index], isShorts: true),
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

  // A helper function to create reusable styled buttons.
  Widget _buildButtons({
    required Color color, // Button background color.
    required String label, // Button label text.
    required Icon icon, // Icon to display inside the button.
  }) {
    return InkWell(
      // Add a tap interaction to the button.
      onTap: () {}, // No action defined yet.
      borderRadius: BorderRadius.circular(24.0), // Add rounded corners.
      child: Container(
        decoration: BoxDecoration(
          color: color, // Apply the passed-in color to the background.
          borderRadius: BorderRadius.circular(24.0), // Rounded corners.
        ),
        child: Padding(
          // Add internal padding for the button's content.
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Button adjusts its size to the content.
            children: [
              icon, // Display the passed-in icon.
              SizedBox(width: 5), // Space between the icon and text.
              Text(label), // Display the label text.
            ],
          ),
        ),
      ),
    );
  }
}
