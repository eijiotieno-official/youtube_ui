import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';

import '../model/video_model.dart';

class VideoDatabase {
  static List<VideoModel> _generateVideos(int count) {
    final random = Random();
    return List.generate(count, (index) {
      return VideoModel(
        id: 'VID${(index + 1).toString().padLeft(3, '0')}',
        title: lorem(paragraphs: 1, words: random.nextInt(5) + 3),
        description: lorem(paragraphs: 1, words: random.nextInt(100) + 10),
        thumbnailUrl: 'https://example.com/images/thumbnail_${index + 1}.jpg',
        videoUrl: 'https://example.com/videos/video_${index + 1}.mp4',
        channelId: 'UC${random.nextInt(90000) + 10000}',
        uploadDateTime: DateTime.now().subtract(Duration(
          days: random.nextInt(365),
          hours: random.nextInt(24),
          minutes: random.nextInt(60),
        )),
        duration: Duration(
          minutes: random.nextInt(15) + 1,
          seconds: random.nextInt(60),
        ),
        likesCount: random.nextInt(100000),
        dislikesCount: random.nextInt(5000),
        viewsCount: random.nextInt(1000000),
        isShorts: random.nextBool(),
      );
    });
  }

  List<VideoModel> getVideos(int count) {
    return _generateVideos(count);
  }
}
