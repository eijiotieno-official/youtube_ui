import 'package:flutter/material.dart';

class SidebarItemModel {
  final int index;
  final IconData iconData; // Icon for the unselected state
  final IconData selectedIconData; // Icon for the selected state
  final String label; // Label of the sidebar item

  // Constructor to initialize the fields
  SidebarItemModel({
    required this.index,
    required this.iconData,
    required this.selectedIconData,
    required this.label,
  });
}
