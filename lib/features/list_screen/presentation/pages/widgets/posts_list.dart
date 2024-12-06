import 'package:codenesslab/features/list_screen/presentation/pages/widgets/item_post.dart';
import 'package:flutter/material.dart';
import '../../controllers/list_controller.dart';

class ItemListView extends StatelessWidget {
  final ListController controller;

  const ItemListView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.filteredItems.isEmpty) {
      return Center(
        child: Text(
          'No items available',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);
        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7, // Adjust this for item card proportions
          ),
          itemCount: controller.filteredItems.length,
          itemBuilder: (context, index) {
            final item = controller.filteredItems[index];
            return ItemPost(item:  item,);
          },
        );
      },
    );
  }

// Method to calculate number of columns based on screen width
  int _calculateCrossAxisCount(double width) {
    if (width < 600) return 2; // Mobile
    if (width < 1200) return 3; // Tablet
    return 4; // Desktop and larger
  }
}
