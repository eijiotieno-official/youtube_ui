import 'package:flutter/material.dart'; // Core Flutter package for UI
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod package for state management

// Import views for the home screen layout
import '../../../src/home/view/feed/feed_view.dart'; // Feed section of the home screen
import '../../../src/home/view/sidebar/sidebar_view.dart'; // Sidebar section
import '../../../src/home/view/nav/nav_view.dart'; // Navigation bar section

// HomeScreen is a stateful widget with Riverpod integration for state management
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key}); // Constructor with a key for widget identity

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

// The state class for HomeScreen
class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Using Material widget to define the base visual styling
    return Material(
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Set background color from theme
      child: Column(
        children: [
          // Navigation bar at the top
          NavView(),
          // Expanded widget allows the content below the NavView to fill the remaining space
          Expanded(
            child: Row(
              children: [
                // SidebarView is on the left side of the layout
                SidebarView(),
                // FeedView occupies the remaining space
                FeedView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
