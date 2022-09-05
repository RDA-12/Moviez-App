part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesState extends Equatable {
  const FavoriteMoviesState();

  @override
  List<Object> get props => [];
}

class FavoriteMoviesInitial extends FavoriteMoviesState {}

class LoadingFavoriteMovies extends FavoriteMoviesState {}

class FavoriteMoviesLoaded extends FavoriteMoviesState {
  final List<Movie> movies;
  const FavoriteMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMoviesLoadingError extends FavoriteMoviesState {
  final String msg;
  const FavoriteMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}

class FavoriteMoviesOperationLoading extends FavoriteMoviesState {}

class FavoriteMoviesOperationFailed extends FavoriteMoviesState {
  final String msg;
  const FavoriteMoviesOperationFailed(this.msg);

  @override
  List<Object> get props => [msg];
}

class FavoriteMoviesAddSuccess extends FavoriteMoviesState {}

class FavoriteMoviesDeleteSuccess extends FavoriteMoviesState {}
