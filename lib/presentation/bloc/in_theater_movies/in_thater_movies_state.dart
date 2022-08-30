part of 'in_theater_movies_bloc.dart';

abstract class InTheaterMoviesState extends Equatable {
  const InTheaterMoviesState();

  @override
  List<Object> get props => [];
}

class InTheaterMoviesInitial extends InTheaterMoviesState {}

class LoadingInTheaterMovies extends InTheaterMoviesState {}

class InTheaterMoviesLoaded extends InTheaterMoviesState {
  final List<Movie> movies;
  const InTheaterMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class InTheaterMoviesLoadingError extends InTheaterMoviesState {
  final String msg;
  const InTheaterMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
