part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetAllFavoriteMovies extends FavoriteMoviesEvent {}

class AddFavoriteMovie extends FavoriteMoviesEvent {
  final Movie movie;
  const AddFavoriteMovie(this.movie);

  @override
  List<Object> get props => [movie];
}

class DeleteFavoriteMovie extends FavoriteMoviesEvent {
  final Movie movie;
  const DeleteFavoriteMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
