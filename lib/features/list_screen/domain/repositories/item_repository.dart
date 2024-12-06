import 'package:dartz/dartz.dart';
import '../entities/item.dart';

abstract class ItemRepository {
  Future<Either<Exception, List<Item>>> fetchItems();
}
