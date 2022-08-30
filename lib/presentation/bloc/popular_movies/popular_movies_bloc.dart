import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/movies/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  PopularMoviesBloc(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial()) {
    on<GetPopularMovies>((event, emit) async {
      emit(LoadingPopularMovies());
      try {
        final List<Movie> movies = await getPopularMoviesUseCase(NoParams());
        emit(PopularMoviesLoaded(movies));
      } catch (e) {
        emit(PopularMoviesLoadingError(e.toString()));
      }
    });
  }
}
