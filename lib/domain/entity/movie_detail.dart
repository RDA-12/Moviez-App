import 'package:equatable/equatable.dart';

import 'movie.dart';

class MovieDetail extends Equatable {
  final String id;
  final String title;
  final String year;
  final String image;
  final String runtime;
  final String plot;
  final String directors;
  final String writers;
  final String actors;
  final String genres;
  final String companies;
  final String contentRating;
  final String imDbRating;
  final String youtubeId;
  final List<Movie> similarMovies;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
    required this.runtime,
    required this.plot,
    required this.directors,
    required this.writers,
    required this.actors,
    required this.genres,
    required this.companies,
    required this.contentRating,
    required this.imDbRating,
    required this.youtubeId,
    required this.similarMovies,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        year,
        image,
        runtime,
        plot,
        directors,
        writers,
        actors,
        genres,
        companies,
        contentRating,
        imDbRating,
        youtubeId,
        similarMovies,
      ];
}
