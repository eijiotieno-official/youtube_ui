import 'package:collection/collection.dart';

import '../model/channel_model.dart';

class ChannelDatabase {
  final List<ChannelModel> channels = [
    ChannelModel(
      id: 'UC12345',
      name: 'Tech Explorers',
      profileImageUrl: 'https://example.com/images/tech_explorers.jpg',
      bannerImageUrl: 'https://example.com/images/tech_banner.jpg',
      description: 'Exploring the latest in technology, gadgets, and software.',
      isVerified: true,
      subscribersCount: 1050000,
      videosId: [],
    ),
    ChannelModel(
      id: 'UC67890',
      name: 'World Travel Diaries',
      profileImageUrl: 'https://example.com/images/travel_diaries.jpg',
      bannerImageUrl: 'https://example.com/images/travel_banner.jpg',
      description: 'Sharing travel experiences and tips from around the globe.',
      isVerified: true,
      subscribersCount: 580000,
      videosId: [],
    ),
    ChannelModel(
      id: 'UC54321',
      name: 'Cooking with Joy',
      profileImageUrl: 'https://example.com/images/cooking_joy.jpg',
      bannerImageUrl: 'https://example.com/images/cooking_banner.jpg',
      description:
          'Delicious recipes and cooking tutorials for every occasion.',
      isVerified: false,
      subscribersCount: 240000,
      videosId: [],
    ),
    ChannelModel(
      id: 'UC98765',
      name: 'Fitness Goals',
      profileImageUrl: 'https://example.com/images/fitness_goals.jpg',
      bannerImageUrl: 'https://example.com/images/fitness_banner.jpg',
      description:
          'Your go-to channel for fitness tips, workouts, and motivation.',
      isVerified: true,
      subscribersCount: 310000,
      videosId: [],
    ),
  ];

  List<ChannelModel> getAllChannels() {
    return channels;
  }

  ChannelModel? getChannelById(String id) {
    return channels.firstWhereOrNull((channel) => channel.id == id);
  }
}
