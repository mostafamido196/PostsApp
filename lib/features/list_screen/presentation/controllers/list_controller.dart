import 'package:get/get.dart';
import '../../domain/entities/item.dart';
import '../../domain/usecases/get_items_usecase.dart';

class ListController extends GetxController {
  final GetItemsUseCase getItemsUseCase;

  ListController({required this.getItemsUseCase});

  // Reactive variables
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final items = <Item>[].obs;
  final filteredItems = <Item>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchItems();

    // React to changes in search query
    ever(searchQuery, (_) => _updateFilteredItems());
  }

  void _fetchItems() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final result = await getItemsUseCase();
      result.fold(
            (failure) {
          hasError.value = true;
          errorMessage.value = 'Failed to load items: ${failure.toString()}';
        },
            (itemList) {
          items.value = itemList;
          filteredItems.value = itemList; // Initialize filteredItems
        },
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'An unexpected error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void searchItems(String query) {
    searchQuery.value = query.trim().toLowerCase();
  }

  void _updateFilteredItems() {
    final query = searchQuery.value;
    if (query.isEmpty) {
      filteredItems.value = items; // Show all items when query is empty
    } else {
      filteredItems.value = items.where((item) {
        // More flexible search - can extend to search multiple fields
        return item.title.toLowerCase().contains(query);
      }).toList();
    }
  }

  void clearSearch() {
    searchQuery.value = '';
  }
}