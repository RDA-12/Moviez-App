import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviez_app/core/usecases/no_params.dart';
import 'package:moviez_app/domain/usecases/movies/get_top_movies_usecase.dart';

import '../../../domain/entity/movie.dart';

part 'top_movies_event.dart';
part 'top_movies_state.dart';

class TopMoviesBloc extends Bloc<TopMoviesEvent, TopMoviesState> {
  final GetTopMoviesUseCase getTopMoviesUseCase;
  TopMoviesBloc(this.getTopMoviesUseCase) : super(TopMoviesInitial()) {
    on<GetTopMovies>((event, emit) async {
      emit(LoadingTopMovies());
      try {
        final List<Movie> movies = await getTopMoviesUseCase(NoParams());
        emit(TopMoviesLoaded(movies));
      } catch (e) {
        emit(TopMoviesLoadingError(e.toString()));
      }
    });
  }
}
