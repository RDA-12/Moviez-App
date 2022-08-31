import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviez_app/domain/entity/movie_detail.dart';
import 'package:moviez_app/domain/usecases/movies/get_movie_detail_usecase.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase movieDetailUseCase;

  MovieDetailBloc(this.movieDetailUseCase) : super(MovieDetailInitial()) {
    on<GetMovieDetail>((event, emit) async {
      emit(LoadingMovieDetail());
      try {
        final String movieId = event.movieId;
        final MovieDetail movie = await movieDetailUseCase(Params(movieId));
        emit(MovieDetailLoaded(movie));
      } catch (e) {
        emit(MovieDetailLoadingError(e.toString()));
      }
    });
  }
}
