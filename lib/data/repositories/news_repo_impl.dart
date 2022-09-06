import '../../domain/entity/news.dart';
import '../../domain/repositories/news_repo.dart';
import '../datasources/remotes/news.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource dataSource;
  NewsRepoImpl(this.dataSource);

  @override
  Future<List<News>> getNews(String page) async {
    return await dataSource.getNews(page);
  }
}
