import '../entity/movie.dart';
import '../entity/movie_detail.dart';

abstract class MovieRepo {
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getInTheatersMovies();
  Future<List<Movie>> getBoxOfficeMovies();
  Future<MovieDetail> getMovieDetail(String movieId);
}
