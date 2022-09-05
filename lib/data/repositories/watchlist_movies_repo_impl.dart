import '../../domain/entity/movie.dart';
import '../../domain/repositories/watchlist_movies_repo.dart';
import '../datasources/remotes/watchlist_movies.dart';
import '../models/movie_model.dart';

class WatchlistMoviesRepoImpl implements WatchlistMoviesRepo {
  final WatchlistMoviesDataSource dataSource;
  WatchlistMoviesRepoImpl(this.dataSource);

  @override
  Future<void> addWatchlistMovie(Movie movie) async {
    await dataSource.addWatchlistMovie(MovieModel.fromMovie(movie));
  }

  @override
  Future<void> deleteWatchlistMovie(Movie movie) async {
    await dataSource.deleteWatchlistMovie(MovieModel.fromMovie(movie));
  }

  @override
  Future<List<Movie>> getAllWatchlistMovies() async {
    return await dataSource.getAllWatchlistMovies();
  }
}
