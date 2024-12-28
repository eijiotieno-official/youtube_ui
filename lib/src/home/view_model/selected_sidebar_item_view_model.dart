import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod provider to manage the selected sidebar item.
/// The provider holds an integer that represents the index of the selected sidebar item.
final selectedSidebarItemProvider = StateProvider<int>(
  (ref) {
    // Initialize the selected index to 0, which corresponds to the first sidebar item
    return 0;
  },
);
