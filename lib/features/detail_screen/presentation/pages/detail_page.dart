import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../list_screen/domain/entities/item.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the item passed as an argument
    final Item item = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              item.body,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
