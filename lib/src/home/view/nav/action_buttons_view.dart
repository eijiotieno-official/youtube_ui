import 'package:flutter/material.dart';

import '../../../../core/view/widget/custom_icon_button.dart';

class ActionButtonsView extends StatelessWidget {
  const ActionButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIconButton(
          onTap: () {},
          icon: Icons.add_circle_outline_outlined,
        ),
        CustomIconButton(
          onTap: () {},
          icon: Icons.notifications_none_rounded,
        ),
        CustomIconButton(
          onTap: () {},
          icon: Icons.settings_outlined,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                'assets/profile.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
