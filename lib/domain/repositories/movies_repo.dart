import '../entity/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getInTheatersMovies();
  Future<List<Movie>> getBoxOfficeMovies();
  Future<Movie> getMovieDetail(String movieId);
}
