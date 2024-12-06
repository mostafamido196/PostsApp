// lib/bindings/app_binding.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../features/list_screen/data/datasources/item_remote_data_source.dart';
import '../features/list_screen/data/repositories/item_repository_impl.dart';
import '../features/list_screen/domain/repositories/item_repository.dart';
import '../features/list_screen/domain/usecases/get_items_usecase.dart';
import '../features/list_screen/presentation/controllers/list_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Register the HTTP client
    Get.lazyPut<http.Client>(() => http.Client());

    // Data source
    Get.lazyPut<ItemRemoteDataSource>(
          () => ItemRemoteDataSourceImpl(client: Get.find()),
    );

    // Repository
    Get.lazyPut<ItemRepository>(
          () => ItemRepositoryImpl(remoteDataSource: Get.find()),
    );

    // Use Case
    Get.lazyPut(() => GetItemsUseCase(repository: Get.find()));

    // Controller
    Get.lazyPut(() => ListController(getItemsUseCase: Get.find()));
  }
}
