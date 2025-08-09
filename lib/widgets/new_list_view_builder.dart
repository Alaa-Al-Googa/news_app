import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';

import '../services/News_service.dart';
import 'news_list_views.dart';

class NewListViewBuilder extends StatefulWidget {
  final String category;

  NewListViewBuilder({super.key, required this.category});

  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  //List<ArticlesModel> articles =[];

  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadline(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListViews(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text('oops there was an error , try later'),
            );
          } else {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });

    //   isLoading?SliverToBoxAdapter(
    //   child: Center(child: CircularProgressIndicator()),
    // ):articles.isNotEmpty ? NewsListViews(
    //   articles: articles,
    // ):SliverToBoxAdapter(
    //   child: Text('oops there was an error , try later'),
    // );
  }
}
