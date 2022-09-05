import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/favorite_movies/add_favorite_movie_usecase.dart'
    as add;
import '../../../domain/usecases/favorite_movies/delete_favorite_movie_usecase.dart'
    as delete;
import '../../../domain/usecases/favorite_movies/get_all_favorite_movies_usecase.dart';

part 'favorite_movies_event.dart';
part 'favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final GetAllFavoriteMoviesUseCase getAllFavoriteMoviesUseCase;
  final add.AddFavoriteMovieUseCase addFavoriteMovieUseCase;
  final delete.DeleteFavoriteMovieUseCase deleteFavoriteMovieUseCase;
  FavoriteMoviesBloc({
    required this.getAllFavoriteMoviesUseCase,
    required this.addFavoriteMovieUseCase,
    required this.deleteFavoriteMovieUseCase,
  }) : super(FavoriteMoviesInitial()) {
    on<GetAllFavoriteMovies>((event, emit) async {
      emit(LoadingFavoriteMovies());
      try {
        final List<Movie> movies =
            await getAllFavoriteMoviesUseCase(NoParams());
        emit(FavoriteMoviesLoaded(movies));
      } catch (e) {
        emit(FavoriteMoviesLoadingError(e.toString()));
      }
    });
    on<AddFavoriteMovie>((event, emit) async {
      emit(FavoriteMoviesOperationLoading());
      try {
        final Movie movie = event.movie;
        await addFavoriteMovieUseCase(add.Params(movie));
        emit(FavoriteMoviesAddSuccess());
        final List<Movie> movies =
            await getAllFavoriteMoviesUseCase(NoParams());
        emit(FavoriteMoviesLoaded(movies));
      } catch (e) {
        emit(FavoriteMoviesOperationFailed(e.toString()));
      }
    });
    on<DeleteFavoriteMovie>((event, emit) async {
      emit(FavoriteMoviesOperationLoading());
      try {
        final Movie movie = event.movie;
        await deleteFavoriteMovieUseCase(delete.Params(movie));
        emit(FavoriteMoviesDeleteSuccess());
        final List<Movie> movies =
            await getAllFavoriteMoviesUseCase(NoParams());
        emit(FavoriteMoviesLoaded(movies));
      } catch (e) {
        emit(FavoriteMoviesOperationFailed(e.toString()));
      }
    });
  }
}
