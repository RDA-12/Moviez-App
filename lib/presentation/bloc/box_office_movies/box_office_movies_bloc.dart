import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/movies/get_box_office_movies_usecase.dart';

part 'box_office_movies_event.dart';
part 'box_office_movies_state.dart';

class BoxOfficeMoviesBloc
    extends Bloc<BoxOfficeMoviesEvent, BoxOfficeMoviesState> {
  final GetBoxOfficeMoviesUseCase getBoxOfficeMoviesUseCase;
  BoxOfficeMoviesBloc(this.getBoxOfficeMoviesUseCase)
      : super(BoxOfficeMoviesInitial()) {
    on<GetBoxOfficeMovies>((event, emit) async {
      emit(LoadingBoxOfficeMovies());
      try {
        final List<Movie> movies = await getBoxOfficeMoviesUseCase(NoParams());
        emit(BoxOfficeMoviesLoaded(movies));
      } catch (e) {
        emit(BoxOfficeMoviesLoadingError(e.toString()));
      }
    });
  }
}
