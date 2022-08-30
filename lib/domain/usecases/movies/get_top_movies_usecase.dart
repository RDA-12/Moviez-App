import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/movies_repo.dart';

class GetTopMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepo repo;
  GetTopMoviesUseCase(this.repo);

  @override
  Future<List<Movie>> call(NoParams params) async {
    try {
      return await repo.getTopMovies();
    } catch (e) {
      rethrow;
    }
  }
}
