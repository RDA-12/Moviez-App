import '../../domain/entity/movie.dart';
import '../../domain/repositories/movies_repo.dart';
import '../datasources/remotes/movies.dart';

class MovieRepoImpl implements MovieRepo {
  final RemoteMoviesDataSource remoteDatasource;
  MovieRepoImpl(this.remoteDatasource);

  @override
  Future<List<Movie>> getBoxOfficeMovies() async {
    try {
      return await remoteDatasource.getBoxOfficeMovies();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movie> getMovieDetail(String movieId) async {
    try {
      return await remoteDatasource.getMovieDetail(movieId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getInTheatersMovies() async {
    try {
      return await remoteDatasource.getInTheatersMovies();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      return await remoteDatasource.getPopularMovies();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getTopMovies() async {
    try {
      return await remoteDatasource.getTopMovies();
    } catch (e) {
      rethrow;
    }
  }
}
