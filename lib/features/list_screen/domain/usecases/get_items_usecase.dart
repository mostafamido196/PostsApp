import 'package:dartz/dartz.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';

class GetItemsUseCase {
  final ItemRepository repository;

  GetItemsUseCase({required this.repository});

  Future<Either<Exception, List<Item>>> call() {
    return repository.fetchItems();
  }
}
