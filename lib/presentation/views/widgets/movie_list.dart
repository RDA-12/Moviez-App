import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/strings.dart';
import '../../../domain/entity/movie.dart';
import '../../bloc/favorite_movies/favorite_movies_bloc.dart';
import '../../bloc/watchlist_movies/watchlist_movies_bloc.dart';
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
                      MovieDetailRoute(movie: movies[index]),
                    )
                  : context.router.push(
                      MovieDetailRoute(movie: movies[index]),
                    );
            },
            onLongPress: () {
              _showBottomSheet(
                context: context,
                movie: movies[index],
              );
            },
            child: CustomNetworkImage(
              imageUrl: movies[index].image,
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet({
    required BuildContext context,
    required Movie movie,
  }) async {
    await showModalBottomSheet(
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (_) {
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            children: [
              TextButton(
                child: const Text(kDetail),
                onPressed: () {
                  context.router.push(MovieDetailRoute(movie: movie));
                  context.router.pop();
                },
              ),
              TextButton(
                child: const Text(kAddToFavorite),
                onPressed: () {
                  context
                      .read<FavoriteMoviesBloc>()
                      .add(AddFavoriteMovie(movie));
                  context.router.pop();
                },
              ),
              TextButton(
                child: const Text(kAddToWatchlist),
                onPressed: () {
                  context
                      .read<WatchlistMoviesBloc>()
                      .add(AddWatchlistMovie(movie));
                  context.router.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
