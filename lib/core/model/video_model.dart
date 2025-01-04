class VideoModel {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String channelName;
  final String channelPhoto;
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
    required this.thumbnail,
    required this.channelName,
    required this.channelPhoto,
    required this.uploadDateTime,
    required this.duration,
    required this.likesCount,
    required this.dislikesCount,
    required this.viewsCount,
    required this.isShorts,
  });
}
