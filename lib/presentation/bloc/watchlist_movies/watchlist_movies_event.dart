part of 'watchlist_movies_bloc.dart';

abstract class WatchlistMoviesEvent extends Equatable {
  const WatchlistMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetAllWatchlistMovies extends WatchlistMoviesEvent {}

class AddWatchlistMovie extends WatchlistMoviesEvent {
  final Movie movie;
  const AddWatchlistMovie(this.movie);

  @override
  List<Object> get props => [movie];
}

class DeleteWatchlistMovie extends WatchlistMoviesEvent {
  final Movie movie;
  const DeleteWatchlistMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
