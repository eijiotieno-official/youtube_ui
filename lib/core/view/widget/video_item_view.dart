import 'package:flutter/material.dart';

import '../../model/video_model.dart'; // Import the video model class.
import '../../utils/string_util.dart'; // Utility functions for formatting strings.
import 'custom_icon_button.dart'; // Custom widget for icon buttons.

// A widget to display individual video items, including thumbnail, title, and metadata.
class VideoItemView extends StatelessWidget {
  final VideoModel video; // The video data to display.
  const VideoItemView({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Set the width of the widget to 20% of the screen width.
      width: MediaQuery.of(context).size.width * 0.2,
      child: Padding(
        // Add spacing around the widget.
        padding: const EdgeInsets.only(
          top: 24.0, // Top spacing.
          right: 16.0, // Right spacing.
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimize the vertical space usage.
          children: [
            _buildVideoThumbnail(context), // Build the video thumbnail.
            _buildInfo(), // Build the video info section.
          ],
        ),
      ),
    );
  }

  // Widget to display the video thumbnail with a duration overlay.
  Widget _buildVideoThumbnail(BuildContext context) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hoverColor, // Background color from theme.
            borderRadius: BorderRadius.circular(16.0), // Rounded corners.
            image: DecorationImage(
              image: AssetImage(video.thumbnail), // Load the thumbnail image.
              fit: BoxFit.cover, // Cover the container fully.
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight, // Align the duration overlay.
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Padding around the overlay.
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      Colors.black, // Black background for the duration text.
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners.
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6.0, // Horizontal padding for text.
                    vertical: 2.0, // Vertical padding for text.
                  ),
                  child: Text(
                    // Format the video duration (e.g., 5:30).
                    StringUtil.formatDurationCompact(video.duration),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  // Widget to display video metadata such as title, channel name, and views.
  Widget _buildInfo() => Padding(
        padding:
            const EdgeInsets.only(top: 12.0), // Spacing above the info section.
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimize vertical space usage.
          children: [
            Row(
              children: [
                // Display the channel's avatar.
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // Space between avatar and title.
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(video.channelPhoto), // Load channel photo.
                  ),
                ),
                // Display the video title.
                Expanded(
                  child: Text(
                    video.title, // The video title.
                    maxLines: 2, // Limit to 2 lines.
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis for overflow.
                  ),
                ),
                // Icon button for additional options (e.g., menu).
                CustomIconButton(
                  onTap: () {}, // Action when the button is tapped.
                  icon: Icons.more_vert, // Three-dot menu icon.
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4.0), // Spacing above metadata.
              child: Row(
                children: [
                  // Placeholder for an additional avatar (can be customized).
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      backgroundColor:
                          Colors.transparent, // Transparent avatar.
                    ),
                  ),
                  Expanded(
                    // Display channel name and metadata.
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align to the start.
                      children: [
                        // Display channel name with a verified icon.
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 4.0), // Space below channel name.
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 4.0), // Space between text and icon.
                                child: Text(
                                  video.channelName, // Channel name.
                                  style: TextStyle(
                                    color: Colors.grey, // Grey text color.
                                  ),
                                ),
                              ),
                              // Verified badge icon.
                              Icon(
                                Icons.verified_rounded,
                                size: 16, // Small icon size.
                                color: Colors.grey, // Grey color for icon.
                              ),
                            ],
                          ),
                        ),
                        // Display views count and time ago.
                        Text(
                          "${StringUtil.formatNumberYouTubeStyle(video.viewsCount)} views . ${StringUtil.timeAgo(video.uploadDateTime)}",
                          style: TextStyle(
                            color: Colors.grey, // Grey text color.
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
