import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/movie_detail.dart';
import '../../repositories/movies_repo.dart';

class GetMovieDetailUseCase implements UseCase<MovieDetail, Params> {
  final MovieRepo repo;
  GetMovieDetailUseCase(this.repo);

  @override
  Future<MovieDetail> call(Params params) async {
    try {
      return await repo.getMovieDetail(params.movieId);
    } catch (e) {
      rethrow;
    }
  }
}

class Params extends Equatable {
  final String movieId;
  const Params(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
