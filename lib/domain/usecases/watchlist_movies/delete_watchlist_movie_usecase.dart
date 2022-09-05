import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/watchlist_movies_repo.dart';

class DeleteWatchlistMovieUseCase extends UseCase<void, Params> {
  final WatchlistMoviesRepo repo;
  DeleteWatchlistMovieUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    await repo.deleteWatchlistMovie(params.movie);
  }
}

class Params extends Equatable {
  final Movie movie;
  const Params(this.movie);

  @override
  List<Object?> get props => [movie];
}
