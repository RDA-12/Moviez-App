import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/movie.dart';
import '../../routes/routes.gr.dart';
import 'custom_network_image.dart';
import 'interactive_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.movies,
    this.replacePage = false,
  }) : super(key: key);

  final List<Movie> movies;
  final bool replacePage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: movies.length > 5 ? 5 : movies.length,
      itemBuilder: (_, index) {
        return AspectRatio(
          aspectRatio: 9 / 16,
          child: InteractiveCard(
            onTap: () {
              replacePage
                  ? context.router.popAndPush(
                      MovieDetailRoute(movieId: movies[index].id),
                    )
                  : context.router.push(
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
    );
  }
}
