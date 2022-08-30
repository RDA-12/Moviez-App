part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class LoadingPopularMovies extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  const PopularMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularMoviesLoadingError extends PopularMoviesState {
  final String msg;
  const PopularMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
