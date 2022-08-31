part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class LoadingMovieDetail extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movie;
  const MovieDetailLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieDetailLoadingError extends MovieDetailState {
  final String msg;
  const MovieDetailLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
