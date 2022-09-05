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

class MovieGrid extends StatelessWidget {
  const MovieGrid({
    super.key,
    required this.movies,
    this.replacePage = false,
    required this.inWatchlist,
    required this.inFavorite,
  });

  final List<Movie> movies;
  final bool replacePage, inWatchlist, inFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 9 / 16,
      ),
      itemCount: movies.length,
      itemBuilder: (_, index) {
        return InteractiveCard(
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
                child: inFavorite
                    ? const Text(kDeleteFromFavorite)
                    : const Text(kAddToFavorite),
                onPressed: () {
                  inFavorite
                      ? context
                          .read<FavoriteMoviesBloc>()
                          .add(DeleteFavoriteMovie(movie))
                      : context
                          .read<FavoriteMoviesBloc>()
                          .add(AddFavoriteMovie(movie));
                  context.router.pop();
                },
              ),
              TextButton(
                child: inWatchlist
                    ? const Text(kDeleteFromWatchlist)
                    : const Text(kAddToWatchlist),
                onPressed: () {
                  inWatchlist
                      ? context
                          .read<WatchlistMoviesBloc>()
                          .add(DeleteWatchlistMovie(movie))
                      : context
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
