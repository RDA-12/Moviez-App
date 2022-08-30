part of 'box_office_movies_bloc.dart';

abstract class BoxOfficeMoviesEvent extends Equatable {
  const BoxOfficeMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetBoxOfficeMovies extends BoxOfficeMoviesEvent {}
