import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/movies/get_in_theater_movies_usecase.dart';

part 'in_thater_movies_state.dart';
part 'in_theater_movies_event.dart';

class InTheaterMoviesBloc
    extends Bloc<InTheaterMoviesEvent, InTheaterMoviesState> {
  final GetInTheaterMoviesUseCase getInTheaterMoviesUseCase;
  InTheaterMoviesBloc(this.getInTheaterMoviesUseCase)
      : super(InTheaterMoviesInitial()) {
    on<GetInTheaterMovies>((event, emit) async {
      emit(LoadingInTheaterMovies());
      try {
        final List<Movie> movies = await getInTheaterMoviesUseCase(NoParams());
        emit(InTheaterMoviesLoaded(movies));
      } catch (e) {
        emit(InTheaterMoviesLoadingError(e.toString()));
      }
    });
  }
}
