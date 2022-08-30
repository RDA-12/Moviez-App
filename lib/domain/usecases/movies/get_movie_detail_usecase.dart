import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/movies_repo.dart';

class GetMovieDetailUseCase implements UseCase<Movie, Params> {
  final MovieRepo repo;
  GetMovieDetailUseCase(this.repo);

  @override
  Future<Movie> call(Params params) async {
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
