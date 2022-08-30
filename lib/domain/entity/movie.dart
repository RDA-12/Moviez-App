import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String image;
  const Movie({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [id, image];
}
