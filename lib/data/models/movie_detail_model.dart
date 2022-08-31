import 'package:moviez_app/data/models/movie_model.dart';
import 'package:moviez_app/domain/entity/movie_detail.dart';

import '../../domain/entity/movie.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.title,
    required super.year,
    required super.image,
    required super.runtime,
    required super.plot,
    required super.directors,
    required super.writers,
    required super.actors,
    required super.genres,
    required super.companies,
    required super.contentRating,
    required super.imDbRating,
    required super.youtubeId,
    required super.similarMovies,
  });

  factory MovieDetailModel.fromJson({
    required Map<String, dynamic> json,
    required String youtubeId,
  }) {
    List<Movie> similarMovies = [];
    for (var data in json["similars"]) {
      similarMovies.add(MovieModel.fromJson(data));
    }
    return MovieDetailModel(
      id: json["id"],
      title: json["fullTitle"] ?? json["title"] ?? json["originalTitle"],
      year: json["year"],
      image: json["image"],
      runtime: json["runtimeStr"] ?? json["runtimeMins"],
      plot: json["plot"],
      directors: json["directors"],
      writers: json["writers"],
      actors: json["stars"],
      genres: json["genres"],
      companies: json["companies"],
      contentRating: json["contentRating"],
      imDbRating: json["imDbRating"],
      youtubeId: youtubeId,
      similarMovies: similarMovies,
    );
  }
}
