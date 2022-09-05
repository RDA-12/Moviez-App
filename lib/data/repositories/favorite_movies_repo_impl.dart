import '../../domain/entity/movie.dart';
import '../../domain/repositories/favorite_movies_repo.dart';
import '../datasources/remotes/favorite_movies.dart';
import '../models/movie_model.dart';

class FavoriteMoviesRepoImpl implements FavoriteMoviesRepo {
  final FavoriteMoviesDataSource dataSource;
  FavoriteMoviesRepoImpl(this.dataSource);

  @override
  Future<void> addFavoriteMovie(Movie movie) async {
    await dataSource.addFavoriteMovie(MovieModel.fromMovie(movie));
  }

  @override
  Future<void> deleteFavoriteMovie(Movie movie) async {
    await dataSource.deleteFavoriteMovie(MovieModel.fromMovie(movie));
  }

  @override
  Future<List<Movie>> getAllFavoriteMovies() async {
    return await dataSource.getAllFavoriteMovies();
  }
}
