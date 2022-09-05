import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/favorite_movies_repo.dart';

class GetAllFavoriteMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final FavoriteMoviesRepo repo;
  GetAllFavoriteMoviesUseCase(this.repo);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repo.getAllFavoriteMovies();
  }
}
