import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/watchlist_movies_repo.dart';

class GetAllWatchlistMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final WatchlistMoviesRepo repo;
  GetAllWatchlistMoviesUseCase(this.repo);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repo.getAllWatchlistMovies();
  }
}
