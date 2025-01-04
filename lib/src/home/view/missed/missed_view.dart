import 'package:flutter/material.dart';

import '../../../../core/database/video_database.dart';
import '../../../../core/model/video_model.dart';
import '../../../../core/view/widget/video_item_view.dart';

// A widget that displays a horizontal list of videos under the title "In Case You Missed".
class MissedView extends StatelessWidget {
  const MissedView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch a list of video models (mock data or database call for videos).
    List<VideoModel> items = VideoDatabase.getVideos(10);

    return SizedBox(
      width: double.infinity, // Take up the full width of the parent container.
      height: MediaQuery.of(context).size.height *
          0.4, // Set height to 40% of the screen height.
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0), // Add spacing above the container.
        child: Container(
          // Style the container with background color and rounded corners.
          decoration: BoxDecoration(
            color: Theme.of(context)
                .hoverColor, // Use the hover color from the current theme.
            borderRadius: BorderRadius.circular(16.0), // Apply rounded corners.
          ),
          child: Padding(
            padding:
                const EdgeInsets.all(24.0), // Add padding inside the container.
            child: Column(
              children: [
                // Align the title to the left of the container.
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "In Case You Missed", // Title of the section.
                    style: TextStyle(
                      fontSize: 24.0, // Set the font size for the title.
                    ),
                  ),
                ),
                Expanded(
                  // Create a horizontally scrollable list of video items.
                  child: ListView.builder(
                    physics:
                        BouncingScrollPhysics(), // Add a bounce effect when scrolling.
                    itemCount: items.length, // Number of items to display.
                    scrollDirection:
                        Axis.horizontal, // Scroll direction is horizontal.
                    itemBuilder: (context, index) {
                      // Create a view for each video item.
                      return VideoItemView(video: items[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
