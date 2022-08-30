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
}
