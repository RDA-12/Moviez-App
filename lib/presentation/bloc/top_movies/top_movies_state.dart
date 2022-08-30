part of 'top_movies_bloc.dart';

abstract class TopMoviesState extends Equatable {
  const TopMoviesState();

  @override
  List<Object> get props => [];
}

class TopMoviesInitial extends TopMoviesState {}

class LoadingTopMovies extends TopMoviesState {}

class TopMoviesLoaded extends TopMoviesState {
  final List<Movie> movies;
  const TopMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopMoviesLoadingError extends TopMoviesState {
  final String msg;
  const TopMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
