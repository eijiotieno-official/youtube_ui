class VideoModel {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final String channelId;
  final DateTime uploadDateTime;
  final Duration duration;
  final int likesCount;
  final int dislikesCount;
  final int viewsCount;
  final bool isShorts;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.channelId,
    required this.uploadDateTime,
    required this.duration,
    required this.likesCount,
    required this.dislikesCount,
    required this.viewsCount,
    required this.isShorts,
  });
}
