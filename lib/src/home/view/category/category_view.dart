import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import custom widgets and view model
import '../../../../core/view/widget/custom_icon_button.dart';
import '../../view_model/selected_category_view_model.dart';
import 'category_item.dart';

class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  // Scroll controller to manage horizontal scrolling
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Initialize the scroll controller
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // Dispose the scroll controller to free resources
    super.dispose();
  }

  // Method to scroll to the end of the ListView
  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      // Check if the scroll controller has clients
      _scrollController.animateTo(
        _scrollController
            .position.maxScrollExtent, // Scroll to the maximum extent
        duration: const Duration(milliseconds: 300), // Animation duration
        curve: Curves.easeInOut, // Smooth scrolling curve
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Predefined list of categories
    final categories = const [
      'Music',
      'Gaming',
      'Movies',
      'News',
      'Fashion',
      'Sports',
      'Tech',
      'Food',
      'Travel',
      'Finance',
      'Education',
      'Health',
      'Beauty',
      'Home',
      'Gardening',
      'DIY',
      'Crafts',
      'Automotive',
      'Pets',
      'Family',
      'Relationships',
      'Fitness',
      'Outdoors',
      'Hobbies',
      'Books',
      'Art',
      'History',
      'Science',
    ];

    final selectedCategory = ref.watch(
        selectedCategoryProvider); // Watch the selected category provider

    final theme = Theme.of(context); // Access the current theme

    final borderRadius =
        BorderRadius.circular(10.0); // Common border radius for UI consistency

    return SizedBox(
      width: double.infinity, // Use full width of the parent
      height: 40.0, // Fixed height for the category view
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10.0), // Space before categories list
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: theme
                        .hoverColor, // Background color for the "tune" button
                    borderRadius: borderRadius,
                  ),
                  child: const Icon(
                      Icons.tune_rounded), // Icon representing settings/tune
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController, // Attach the scroll controller
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: categories.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    final String category =
                        categories[index]; // Get the category at index

                    final bool isSelected = selectedCategory ==
                        category; // Check if the category is selected

                    return CategoryItem(
                      category: category,
                      isSelected: isSelected,
                      onTap: () {
                        ref.read(selectedCategoryProvider.notifier).state =
                            category;

                        debugPrint('Selected category: $category , fetching category items');
                      },
                    ); // Build the category item
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                  child:
                      Container()), // Spacer to align the gradient and button to the right
              Container(
                width: 100, // Fixed width for the gradient area
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent, // Transparent to opaque gradient
                      theme.scaffoldBackgroundColor.withOpacity(0.15),
                      theme.scaffoldBackgroundColor,
                    ],
                  ),
                ),
                child: Align(
                  alignment:
                      Alignment.centerRight, // Align the button to the right
                  child: CustomIconButton(
                    onTap:
                        _scrollToEnd, // Scroll to the end when button is tapped
                    icon: Icons
                        .keyboard_arrow_right_rounded, // Icon for the button
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
