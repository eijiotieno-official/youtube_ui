import 'package:flutter/material.dart';

import '../../../../core/database/video_database.dart';
import '../../../../core/model/video_model.dart';
import '../../../../core/view/widget/video_item_view.dart';

// A widget that displays a grid of videos with the title "In Case You Missed".
class ForYouView extends StatelessWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch a list of 6 video models (mock data or database call for videos).
    List<VideoModel> items = VideoDatabase.getVideos(count: 6);

    return Padding(
      // Add spacing at the top and bottom of the entire widget.
      padding: const EdgeInsets.only(
        bottom: 24.0,
        top: 8.0,
      ),
      child: LayoutBuilder(
        // A LayoutBuilder to handle widget layout constraints dynamically.
        builder: (context, constraints) {
          return GridView.builder(
            // Disable scrolling for the GridView as it is used inside a scrollable view.
            physics: NeverScrollableScrollPhysics(),
            // Set the number of items to display based on the length of the list.
            itemCount: items.length,
            // Optimize layout by shrinking the GridView to fit the content size.
            shrinkWrap: true,
            // Define the grid layout using a fixed number of columns.
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Display 3 items per row.
              childAspectRatio: 1.35, // Adjust the aspect ratio of the items.
              crossAxisSpacing: 24.0, // Horizontal spacing between grid items.
            ),
            itemBuilder: (context, index) {
              // Build a VideoItemView for each video in the list.
              return VideoItemView(video: items[index]);
            },
          );
        },
      ),
    );
  }
}
