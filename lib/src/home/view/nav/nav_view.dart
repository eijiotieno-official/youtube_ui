import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_ui/src/home/view/nav/action_buttons_view.dart';
import 'package:youtube_ui/src/home/view/nav/search_input_view.dart';

import '../../../../core/view/widget/custom_icon_button.dart';

class NavView extends ConsumerWidget {
  const NavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CustomIconButton(
              onTap: () {},
              icon: Icons.menu_rounded,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () {},
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: Image.asset(
                  height: 100,
                  width: 100,
                  "assets/logo.png",
                  key: const Key('logo'),
                ),
              ),
            ),
            Spacer(),
            SearchInputView(),
            Spacer(),
            ActionButtonsView(),
          ],
        ),
      ),
    );
  }
}
