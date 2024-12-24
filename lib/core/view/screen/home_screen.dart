import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../src/home/view/feed/feed_view.dart';
import '../../../src/home/view/sidebar/sidebar_view.dart';
import '../../../src/home/view/nav/nav_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          NavView(),
          Expanded(
            child: Row(
              children: [
                SidebarView(),
                FeedView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
