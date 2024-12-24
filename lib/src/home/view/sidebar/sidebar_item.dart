import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/view/widget/custom_icon_button.dart';
import '../../view_model/selected_sidebar_item_view_model.dart';

class SidebarItem extends ConsumerStatefulWidget {
  final int index;
  final IconData iconData;
  final IconData selectedIconData;
  final String label;
  const SidebarItem({
    super.key,
    required this.iconData,
    required this.selectedIconData,
    required this.label,
    required this.index,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SidebarItemState();
}

class _SidebarItemState extends ConsumerState<SidebarItem> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = ref.watch(selectedSidebarItemProvider) == widget.index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: widget.index < 6
                ? () {
                    ref.read(selectedSidebarItemProvider.notifier).state =
                        widget.index;
                  }
                : null,
            selected: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            leading:
                Icon(isSelected ? widget.selectedIconData : widget.iconData),
            title: Text(widget.label),
            trailing: widget.index > 6
                ? CustomIconButton(
                    onTap: _toggleExpansion,
                    icon: _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                  )
                : null,
          ),
          _buildExpandedItems(),
          if (widget.index == 3 || widget.index == 7 || widget.index == 9)
            Divider(),
        ],
      ),
    );
  }

  Widget _buildExpandedItems() {
    String label = widget.label;

    return _isExpanded
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: widget.index == 9
                    ? CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          'assets/profile.png',
                        ),
                      )
                    : null,
                title: Text('$label $index'),
              );
            },
          )
        : const SizedBox.shrink();
  }
}
