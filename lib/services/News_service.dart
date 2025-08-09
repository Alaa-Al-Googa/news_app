import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/models/articles_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticlesModel>> getTopHeadline({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a997f4d900404f08ab8e3f93632e0c3d');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticlesModel> ArticlesList = [];

      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.formJson(article);

        ArticlesList.add(articlesModel);
      }
      return ArticlesList;
    } catch (e) {
      return [];
    }
  }
}
