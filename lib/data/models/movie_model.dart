import '../../domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      image: json["image"],
    );
  }

  factory MovieModel.fromMovie(Movie movie) {
    return MovieModel(id: movie.id, image: movie.image);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
    };
  }
}
