import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/news.dart';
import '../../repositories/news_repo.dart';

class GetNewsUseCase extends UseCase<List<News>, Params> {
  final NewsRepo repo;
  GetNewsUseCase(this.repo);

  @override
  Future<List<News>> call(Params params) async {
    return await repo.getNews(params.page);
  }
}

class Params extends Equatable {
  final String page;
  const Params(this.page);

  @override
  List<Object?> get props => [page];
}
