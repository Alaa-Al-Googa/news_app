import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/services/News_service.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListViews extends StatefulWidget {
  const NewsListViews({super.key});

  @override
  State<NewsListViews> createState() => _NewsListViewsState();
}

class _NewsListViewsState extends State<NewsListViews> {
  List<ArticlesModel> articles = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGenaerlNews();
  }

  Future<void> getGenaerlNews() async {
    articles = await NewsService(Dio()).getTopHeadline(category: '');
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(childCount: articles.length,
                (context, index) {
              return NewsTile(
                articlesModel: articles[index],
              );
            }),
          );
  }
}
