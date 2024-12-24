import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSidebarItemProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);
