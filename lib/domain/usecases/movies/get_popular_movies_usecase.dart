import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/movies_repo.dart';

class GetPopularMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepo repo;
  GetPopularMoviesUseCase(this.repo);

  @override
  Future<List<Movie>> call(NoParams params) async {
    try {
      return await repo.getPopularMovies();
    } catch (e) {
      rethrow;
    }
  }
}
