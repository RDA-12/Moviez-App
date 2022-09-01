import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/movie.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/movie_list.dart';
import '../../widgets/vertical_space.dart';

class MovieListHolder extends StatelessWidget {
  const MovieListHolder({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            if (movies.length > 5)
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      SeeAllRoute(movies: movies, title: title),
                    );
                  },
                  child: const Text("See All"),
                ),
              ),
          ],
        ),
        const VerticalSpace(height: 12),
        Expanded(
          child: MovieList(movies: movies),
        ),
      ],
    );
  }
}
