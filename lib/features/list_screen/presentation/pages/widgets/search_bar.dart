import 'package:flutter/material.dart';
import '../../controllers/list_controller.dart';


class CustomSearchBar extends StatelessWidget {
  final ListController controller;

  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search items',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Theme
            .of(context)
            .inputDecorationTheme
            .fillColor ?? Colors.white,
      ),
      onChanged: (value){controller.searchItems(value);},

    );
  }
}