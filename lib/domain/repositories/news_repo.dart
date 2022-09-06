import '../entity/news.dart';

abstract class NewsRepo {
  Future<List<News>> getNews(String page);
}
