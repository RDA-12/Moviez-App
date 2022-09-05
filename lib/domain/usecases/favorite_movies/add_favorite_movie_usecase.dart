import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../entity/movie.dart';
import '../../repositories/favorite_movies_repo.dart';

class AddFavoriteMovieUseCase extends UseCase<void, Params> {
  final FavoriteMoviesRepo repo;
  AddFavoriteMovieUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    await repo.addFavoriteMovie(params.movie);
  }
}

class Params extends Equatable {
  final Movie movie;
  const Params(this.movie);

  @override
  List<Object?> get props => [movie];
}
