import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sidebar_item.dart';

class SidebarView extends ConsumerWidget {
  const SidebarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 300,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: List.generate(
          10,
          (index) {
            IconData iconData = Icons.home_outlined;

            IconData selectedIconData = Icons.home;

            String label = "Home";

            switch (index) {
              case 0:
                iconData = Icons.home_outlined;
                selectedIconData = Icons.home;
                label = "Home";
                break;
              case 1:
                iconData = Icons.explore_outlined;
                selectedIconData = Icons.explore;
                label = "Explore";
                break;
              case 2:
                iconData = Icons.auto_graph_outlined;
                selectedIconData = Icons.auto_graph;
                label = "Shorts";
                break;
              case 3:
                iconData = Icons.tv_outlined;
                selectedIconData = Icons.tv;
                label = "TV Mode";
                break;
              case 4:
                iconData = Icons.history_outlined;
                selectedIconData = Icons.history;
                label = "History";
                break;
              case 5:
                iconData = Icons.watch_later_outlined;
                selectedIconData = Icons.watch_later;
                label = "Watch Later";
                break;
              case 6:
                iconData = Icons.thumb_up_outlined;
                selectedIconData = Icons.thumb_up;
                label = "Liked Videos";
                break;
              case 7:
                iconData = Icons.playlist_play_outlined;
                selectedIconData = Icons.playlist_play;
                label = "Playlists";
                break;
              case 8:
                iconData = Icons.collections_outlined;
                selectedIconData = Icons.collections;
                label = "Collections";
                break;
              case 9:
                iconData = Icons.subscriptions_outlined;
                selectedIconData = Icons.subscriptions;
                label = "Subscriptions";
                break;
              default:
            }
            return SidebarItem(
              iconData: iconData,
              selectedIconData: selectedIconData,
              label: label,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
