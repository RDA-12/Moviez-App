import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  const News({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, url, imageUrl];
}
