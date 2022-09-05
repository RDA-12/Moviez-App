import '../entity/movie.dart';

abstract class WatchlistMoviesRepo {
  Future<List<Movie>> getAllWatchlistMovies();
  Future<void> addWatchlistMovie(Movie movie);
  Future<void> deleteWatchlistMovie(Movie movie);
}
