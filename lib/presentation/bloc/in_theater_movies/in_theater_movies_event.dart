part of 'in_theater_movies_bloc.dart';

abstract class InTheaterMoviesEvent extends Equatable {
  const InTheaterMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetInTheaterMovies extends InTheaterMoviesEvent {}
