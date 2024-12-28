import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/base/sidebar_item_model.dart';
import 'sidebar_item.dart';

/// A view that displays the sidebar with multiple items.
class SidebarView extends ConsumerWidget {
  SidebarView({super.key});

  final List<SidebarItemModel> items = [
    SidebarItemModel(
      index: 0,
      iconData: Icons.home_outlined,
      selectedIconData: Icons.home,
      label: "Home",
    ),
    SidebarItemModel(
      index: 1,
      iconData: Icons.explore_outlined,
      selectedIconData: Icons.explore,
      label: "Explore",
    ),
    SidebarItemModel(
      index: 2,
      iconData: Icons.auto_graph_outlined,
      selectedIconData: Icons.auto_graph,
      label: "Shorts",
    ),
    SidebarItemModel(
      index: 3,
      iconData: Icons.tv_outlined,
      selectedIconData: Icons.tv,
      label: "TV Mode",
    ),
    SidebarItemModel(
      index: 4,
      iconData: Icons.history_outlined,
      selectedIconData: Icons.history,
      label: "History",
    ),
    SidebarItemModel(
      index: 5,
      iconData: Icons.watch_later_outlined,
      selectedIconData: Icons.watch_later,
      label: "Watch Later",
    ),
    SidebarItemModel(
      index: 6,
      iconData: Icons.thumb_up_outlined,
      selectedIconData: Icons.thumb_up,
      label: "Liked Videos",
    ),
    SidebarItemModel(
      index: 7,
      iconData: Icons.playlist_play_outlined,
      selectedIconData: Icons.playlist_play,
      label: "Playlists",
    ),
    SidebarItemModel(
      index: 8,
      iconData: Icons.collections_outlined,
      selectedIconData: Icons.collections,
      label: "Collections",
    ),
    SidebarItemModel(
      index: 9,
      iconData: Icons.subscriptions_outlined,
      selectedIconData: Icons.subscriptions,
      label: "Subscriptions",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a full-screen sidebar with a fixed width
    return SizedBox(
      width: 300, // Fixed width for sidebar
      height: MediaQuery.of(context).size.height, // Full height of the screen
      child: ListView.builder(
        itemCount: items.length, // Use the length of the list
        itemBuilder: (context, index) {
          final model = items[index];

          // Return a SidebarItem widget for each item
          return SidebarItem(model: model);
        },
      ),
    );
  }
}
