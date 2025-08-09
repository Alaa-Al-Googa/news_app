import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListViews extends StatelessWidget {
  NewsListViews({super.key, required this.articles});

  final List<ArticlesModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length,
          (context, index) {
        return NewsTile(
          articlesModel: articles[index],
        );
      }),
    );
  }
}
