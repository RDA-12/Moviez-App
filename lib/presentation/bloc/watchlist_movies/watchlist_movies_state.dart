part of 'watchlist_movies_bloc.dart';

abstract class WatchlistMoviesState extends Equatable {
  const WatchlistMoviesState();

  @override
  List<Object> get props => [];
}

class WatchlistMoviesInitial extends WatchlistMoviesState {}

class LoadingWatchlistMovies extends WatchlistMoviesState {}

class WatchlistMoviesLoaded extends WatchlistMoviesState {
  final List<Movie> movies;
  const WatchlistMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class WatchlistMoviesLoadingError extends WatchlistMoviesState {
  final String msg;
  const WatchlistMoviesLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}

class WatchlistMoviesOperationLoading extends WatchlistMoviesState {}

class WatchlistMoviesAddSuccess extends WatchlistMoviesState {}

class WatchlistMoviesDeleteSuccess extends WatchlistMoviesState {}

class WatchlistMoviesOperationFailed extends WatchlistMoviesState {
  final String msg;
  const WatchlistMoviesOperationFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
