import 'package:dartz/dartz.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_remote_data_source.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<Item>>> fetchItems() async {
    try {
      final models = await remoteDataSource.fetchItems();
      return Right(models.map((model) => Item(id: model.id, title: model.title, body: model.body)).toList());
    } catch (e) {
      return Left(Exception('Error fetching items'));
    }
  }
}
