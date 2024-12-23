import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/repository/video_repository.dart';

final homeVideoRepositoryProvider = Provider<VideoRepository>(
  (ref) {
    return VideoRepository();
  },
);
