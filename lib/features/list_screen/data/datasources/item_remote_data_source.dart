// fetch api call
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

abstract class ItemRemoteDataSource {
  Future<List<ItemModel>> fetchItems();
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final http.Client client;

  ItemRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ItemModel>> fetchItems() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }
}
