import 'package:flutter/material.dart';

import '../../../../domain/entity/movie.dart';
import '../../widgets/movie_grid.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({
    Key? key,
    required this.movies,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MovieGrid(
          movies: movies,
          inFavorite: false,
          inWatchlist: false,
        ),
      ),
    );
  }
}
