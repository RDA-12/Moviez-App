import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/watchlist_movies_repo.dart';

class AddWatchlistMovieUseCase extends UseCase<void, Params> {
  final WatchlistMoviesRepo repo;
  AddWatchlistMovieUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    await repo.addWatchlistMovie(params.movie);
  }
}

class Params extends Equatable {
  final Movie movie;
  const Params(this.movie);

  @override
  List<Object?> get props => [movie];
}
