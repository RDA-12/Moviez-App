import '../entity/movie.dart';

abstract class FavoriteMoviesRepo {
  Future<List<Movie>> getAllFavoriteMovies();
  Future<void> addFavoriteMovie(Movie movie);
  Future<void> deleteFavoriteMovie(Movie movie);
}
