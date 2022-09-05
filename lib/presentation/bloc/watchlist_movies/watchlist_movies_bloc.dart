import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/watchlist_movies/get_all_watchlist_movies_usecase.dart';
import '../../../domain/usecases/watchlist_movies/add_watchlist_movie_usecase.dart'
    as add;
import '../../../domain/usecases/watchlist_movies/delete_watchlist_movie_usecase.dart'
    as delete;

part 'watchlist_movies_event.dart';
part 'watchlist_movies_state.dart';

class WatchlistMoviesBloc
    extends Bloc<WatchlistMoviesEvent, WatchlistMoviesState> {
  final GetAllWatchlistMoviesUseCase getAllWatchlistMoviesUseCase;
  final add.AddWatchlistMovieUseCase addWatchlistMovieUseCase;
  final delete.DeleteWatchlistMovieUseCase deleteWatchlistMovieUseCase;
  WatchlistMoviesBloc({
    required this.getAllWatchlistMoviesUseCase,
    required this.addWatchlistMovieUseCase,
    required this.deleteWatchlistMovieUseCase,
  }) : super(WatchlistMoviesInitial()) {
    on<GetAllWatchlistMovies>((event, emit) async {
      emit(LoadingWatchlistMovies());
      try {
        final List<Movie> movies =
            await getAllWatchlistMoviesUseCase(NoParams());
        emit(WatchlistMoviesLoaded(movies));
      } catch (e) {
        emit(WatchlistMoviesLoadingError(e.toString()));
      }
    });
    on<AddWatchlistMovie>((event, emit) async {
      emit(WatchlistMoviesOperationLoading());
      try {
        final Movie movie = event.movie;
        await addWatchlistMovieUseCase(add.Params(movie));
        emit(WatchlistMoviesAddSuccess());
        final List<Movie> movies =
            await getAllWatchlistMoviesUseCase(NoParams());
        emit(WatchlistMoviesLoaded(movies));
      } catch (e) {
        emit(WatchlistMoviesOperationFailed(e.toString()));
      }
    });
    on<DeleteWatchlistMovie>((event, emit) async {
      emit(WatchlistMoviesOperationLoading());
      try {
        final Movie movie = event.movie;
        await deleteWatchlistMovieUseCase(delete.Params(movie));
        emit(WatchlistMoviesDeleteSuccess());
        final List<Movie> movies =
            await getAllWatchlistMoviesUseCase(NoParams());
        emit(WatchlistMoviesLoaded(movies));
      } catch (e) {
        emit(WatchlistMoviesOperationFailed(e.toString()));
      }
    });
  }
}
