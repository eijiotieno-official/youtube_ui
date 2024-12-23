import '../../../../core/database/video_database.dart';
import '../../../../core/model/video_model.dart';

class VideoRepository {
  final VideoDatabase _videoDatabase = VideoDatabase();

  Future<List<VideoModel>> fetchMissedVideos() async {
    final videos = _videoDatabase.getVideos(10);

    return videos
        .where((video) => video.uploadDateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  Future<List<VideoModel>> fetchFeedVideos() async {
    final videos = _videoDatabase.getVideos(10);

    return videos
        .where((video) => video.uploadDateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  Future<List<VideoModel>> fetchSuggestedVideos() async {
    final videos = _videoDatabase.getVideos(10);

    return videos
        .where((video) => video.uploadDateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  Future<List<VideoModel>> fetchShortsVideos() async {
    final videos = _videoDatabase.getVideos(10);

    return videos.where((test) => test.isShorts).toList();
  }
}
