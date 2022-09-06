import 'package:dio/dio.dart';

import '../../../core/resources/strings.dart';
import '../../../core/resources/urls.dart';
import '../../models/news.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews(String page);
}

class NewsAPI implements NewsRemoteDataSource {
  final Dio dio;
  NewsAPI(this.dio);

  @override
  Future<List<NewsModel>> getNews(String page) async {
    try {
      final Response response = await dio.get(urls.getNewsUrl(page));
      List<NewsModel> newsList = [];
      for (final news in response.data["articles"]) {
        newsList.add(NewsModel.fromJson(news));
      }
      return newsList;
    } catch (e) {
      throw kServerError;
    }
  }
}
