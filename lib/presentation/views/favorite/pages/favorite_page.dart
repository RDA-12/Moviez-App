import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie.dart';
import '../../../bloc/favorite_movies/favorite_movies_bloc.dart';
import '../../widgets/movie_grid.dart';
import '../../widgets/vertical_space.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.inHome}) : super(key: key);

  final bool inHome;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteMoviesBloc>().add(GetAllFavoriteMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.inHome ? null : AppBar(title: const Text("Favorites")),
      body: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
        buildWhen: (_, currentState) {
          return (currentState is FavoriteMoviesLoaded ||
              currentState is FavoriteMoviesLoadingError ||
              currentState is LoadingFavoriteMovies);
        },
        builder: (_, state) {
          if (state is FavoriteMoviesInitial ||
              state is LoadingFavoriteMovies) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoriteMoviesLoadingError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.msg),
                  const VerticalSpace(height: 12),
                  IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      context
                          .read<FavoriteMoviesBloc>()
                          .add(GetAllFavoriteMovies());
                    },
                  ),
                ],
              ),
            );
          }
          if (state is FavoriteMoviesLoaded) {
            final List<Movie> movies = state.movies;
            return movies.isNotEmpty
                ? MovieGrid(
                    movies: movies,
                    inFavorite: true,
                    inWatchlist: false,
                  )
                : Center(
                    child: Text(
                    kYouDontHaveFavoriteMovies,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ));
          }
          return const Center(
            child: Text(kUnexpectedError),
          );
        },
      ),
    );
  }
}
