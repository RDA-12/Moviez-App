part of 'box_office_movies_bloc.dart';

abstract class BoxOfficeMoviesState extends Equatable {
  const BoxOfficeMoviesState();

  @override
  List<Object> get props => [];
}

class BoxOfficeMoviesInitial extends BoxOfficeMoviesState {}

class LoadingBoxOfficeMovies extends BoxOfficeMoviesState {}

class BoxOfficeMoviesLoaded extends BoxOfficeMoviesState {
  final List<Movie> movies;
  const BoxOfficeMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class BoxOfficeMoviesLoadingError extends BoxOfficeMoviesState {
  final String msg;
  const BoxOfficeMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
