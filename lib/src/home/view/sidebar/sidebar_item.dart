import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/base/sidebar_item_model.dart';

import '../../../../core/view/widget/custom_icon_button.dart'; // Custom reusable button widget
import '../../view_model/selected_sidebar_item_view_model.dart'; // View model for sidebar state management

/// A widget representing a single item in the sidebar, with optional expansion.
class SidebarItem extends ConsumerStatefulWidget {
  final SidebarItemModel model; // Sidebar item model

  const SidebarItem({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SidebarItemState();
}

class _SidebarItemState extends ConsumerState<SidebarItem> {
  bool _isExpanded = false; // Tracks whether the item is expanded

  /// Toggles the expansion state of the sidebar item.
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the current item is selected
    bool isSelected =
        ref.watch(selectedSidebarItemProvider) == widget.model.index;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 2.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimize height to fit content
        children: [
          // Main clickable tile
          ListTile(
            onTap: widget.model.index < 7
                ? () {
                    ref.read(selectedSidebarItemProvider.notifier).state =
                        widget.model.index; // Update selected item state
                  }
                : null, // Disable tap for specific indices
            selected: isSelected, // Highlight if selected
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8.0), // Rounded corners for better design
            ),
            leading: Icon(
              isSelected
                  ? widget.model.selectedIconData
                  : widget.model.iconData, // Icon based on selection state
            ),
            title: Text(widget.model.label), // Display the label
            trailing: widget.model.index > 6
                ? CustomIconButton(
                    onTap: _toggleExpansion, // Handle expansion toggle
                    icon: _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded, // Toggle icon
                  )
                : null, // Only show toggle button for expandable items
          ),
          // Display expanded items if the sidebar item is expanded
          _buildExpandedItems(),
          // Add a divider for specific indices
          if (widget.model.index == 3 ||
              widget.model.index == 7 ||
              widget.model.index == 9)
            Divider(), // Divider for visual separation
        ],
      ),
    );
  }

  /// Builds a list of items to display when the sidebar item is expanded.
  Widget _buildExpandedItems() {
    String label = widget.model.label; // Use the label as a prefix for items

    return _isExpanded
        ? ListView.builder(
            shrinkWrap: true, // Allow the ListView to wrap its content
            physics:
                NeverScrollableScrollPhysics(), // Disable scrolling for better UI integration
            itemCount: 3, // Example count of expanded items
            itemBuilder: (context, index) {
              return ListTile(
                leading: widget.model.index == 9
                    ? CircleAvatar(
                        radius: 15, // Profile image size
                        backgroundImage: AssetImage(
                          'assets/profile.png', // Placeholder image
                        ),
                      )
                    : null, // Show avatar only for specific index
                title: Text('$label $index'), // Dynamic label for items
              );
            },
          )
        : const SizedBox.shrink(); // Placeholder when not expanded
  }
}
