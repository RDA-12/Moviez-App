import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie.dart';
import '../../../bloc/watchlist_movies/watchlist_movies_bloc.dart';
import '../../widgets/movie_grid.dart';
import '../../widgets/vertical_space.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistMoviesBloc>().add(GetAllWatchlistMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Watchlist")),
      body: BlocBuilder<WatchlistMoviesBloc, WatchlistMoviesState>(
        buildWhen: (_, currentState) {
          return (currentState is WatchlistMoviesLoaded ||
              currentState is WatchlistMoviesLoadingError ||
              currentState is LoadingWatchlistMovies);
        },
        builder: (_, state) {
          if (state is WatchlistMoviesInitial ||
              state is LoadingWatchlistMovies) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WatchlistMoviesLoadingError) {
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
                          .read<WatchlistMoviesBloc>()
                          .add(GetAllWatchlistMovies());
                    },
                  ),
                ],
              ),
            );
          }
          if (state is WatchlistMoviesLoaded) {
            final List<Movie> movies = state.movies;
            return movies.isNotEmpty
                ? MovieGrid(
                    movies: movies,
                    inFavorite: false,
                    inWatchlist: true,
                  )
                : Center(
                    child: Text(
                      kYouDontHaveWatchlistMovies,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  );
          }
          return const Center(
            child: Text(kUnexpectedError),
          );
        },
      ),
    );
  }
}
