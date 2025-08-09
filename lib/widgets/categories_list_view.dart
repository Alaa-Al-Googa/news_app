import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<CategoryModel> categoriys = [
    CategoryModel(categoryName: 'Business', image: 'assets/entertaiment.avif'),
    CategoryModel(
        categoryName: 'Entertainment', image: 'assets/entertaiment.avif'),
    CategoryModel(categoryName: 'General', image: 'assets/science.avif'),
    CategoryModel(categoryName: 'Health', image: 'assets/health.avif'),
    CategoryModel(categoryName: 'Science', image: 'assets/science.avif'),
    CategoryModel(categoryName: 'Sports', image: 'assets/technology.jpeg'),
    CategoryModel(categoryName: 'Technology', image: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriys.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoriys[index],
            );
          }),
    );
  }
}
