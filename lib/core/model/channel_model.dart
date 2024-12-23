class ChannelModel {
  final String id;
  final String name;
  final String profileImageUrl;
  final String bannerImageUrl;
  final String description;
  final bool isVerified;
  final int subscribersCount;
  final List<String> videosId;

  ChannelModel({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.bannerImageUrl,
    required this.description,
    required this.isVerified,
    required this.subscribersCount,
    required this.videosId,
  });
}
