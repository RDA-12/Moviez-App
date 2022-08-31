import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviez_app/presentation/views/home/widgets/interactive_card.dart';

import '../../../../domain/entity/movie.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/vertical_space.dart';
import 'custom_network_image.dart';

class MovieList extends StatelessWidget {
  const MovieList({
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
                    context.router.push(SeeAllRoute(
                      movies: movies,
                      title: title,
                    ));
                  },
                  child: const Text("See All"),
                ),
              )
          ],
        ),
        const VerticalSpace(height: 12),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length > 5 ? 5 : movies.length,
            itemBuilder: (_, index) {
              return AspectRatio(
                aspectRatio: 9 / 16,
                child: InteractiveCard(
                  onTap: () {
                    context.router.push(
                      MovieDetailRoute(movieId: movies[index].id),
                    );
                  },
                  onLongPress: () {
                    // TODO: show bottomsheet
                  },
                  child: CustomNetworkImage(
                    imageUrl: movies[index].image,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
