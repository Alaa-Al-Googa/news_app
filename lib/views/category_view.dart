import 'package:flutter/material.dart';
import 'package:news/widgets/new_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;

  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewListViewBuilder(
            category: category,
          ),
        ],
      ),
    );
  }
}
