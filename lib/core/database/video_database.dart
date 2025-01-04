import 'dart:math'; // Import for random number generation.
import 'package:flutter_lorem/flutter_lorem.dart'; // Import for generating dummy text.

import '../model/video_model.dart'; // Import the video model class.
import 'asset_database.dart'; // Import the asset database for asset paths.

// A utility class to generate video data for testing or mock purposes.
class VideoDatabase {
  // Private method to generate a list of `VideoModel` objects.
  static List<VideoModel> _generateVideos(int count) {
    final random = Random(); // Random number generator for randomizing data.

    return List.generate(
      count, // Number of videos to generate.
      (index) {
        // Create a new `VideoModel` for each index.
        return VideoModel(
          id: 'VID${(index + 1).toString().padLeft(3, '0')}',
          // Generate an ID like VID001, VID002, etc.

          title: lorem(
            paragraphs: 1,
            words: random.nextInt(20) + 3,
          ),
          // Generate a random title with 3–22 words.

          description: lorem(
            paragraphs: 1,
            words: random.nextInt(100) + 10,
          ),
          // Generate a random description with 10–110 words.

          thumbnail: AssetDatabase.getThumbnails()[index],
          // Retrieve a thumbnail asset path using the index.

          channelName: 'UC${random.nextInt(90000) + 10000}',
          // Generate a random channel name resembling YouTube channel IDs.

          channelPhoto: AssetDatabase.getProfiles()[index],
          // Retrieve a profile photo asset path using the index.

          uploadDateTime: DateTime.now().subtract(Duration(
            days: random.nextInt(365), // Random day within the last year.
            hours: random.nextInt(24), // Random hour.
            minutes: random.nextInt(60), // Random minute.
          )),
          // Generate a random upload date and time within the past year.

          duration: Duration(
            minutes: random.nextInt(15) + 1, // Random duration of 1–15 minutes.
            seconds: random.nextInt(60), // Random seconds.
          ),
          // Generate a random video duration.

          likesCount: random.nextInt(100000),
          // Generate a random number of likes (0–99,999).

          dislikesCount: random.nextInt(5000),
          // Generate a random number of dislikes (0–4,999).

          viewsCount: random.nextInt(1000000),
          // Generate a random number of views (0–999,999).

          isShorts: random.nextBool(),
          // Randomly determine if the video is a "short".
        );
      },
    );
  }

  // Public method to retrieve a list of videos.
  static List<VideoModel> getVideos(int count) {
    return _generateVideos(count);
    // Call the private method to generate the requested number of videos.
  }
}
