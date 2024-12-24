import 'package:flutter/material.dart';
import '../../../../core/view/widget/custom_icon_button.dart';

class SearchInputView extends StatelessWidget {
  const SearchInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          leading: CustomIconButton(
            onTap: () {},
            icon: Icons.search_rounded,
          ),
          onTap: () => controller.openView(),
          hintText: "Search",
          trailing: [
            CustomIconButton(
              onTap: () {},
              icon: Icons.mic_rounded,
            ),
          ],
        );
      },
      suggestionsBuilder: (context, controller) {
        return [];
      },
    );
  }
}
