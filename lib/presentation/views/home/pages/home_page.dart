import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie.dart';
import '../../../bloc/box_office_movies/box_office_movies_bloc.dart';
import '../../../bloc/in_theater_movies/in_theater_movies_bloc.dart';
import '../../../bloc/popular_movies/popular_movies_bloc.dart';
import '../../../bloc/top_movies/top_movies_bloc.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/content_container.dart';
import '../widgets/movie_list_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TopMoviesBloc>().add(GetTopMovies());
    context.read<PopularMoviesBloc>().add(GetPopularMovies());
    context.read<InTheaterMoviesBloc>().add(GetInTheaterMovies());
    context.read<BoxOfficeMoviesBloc>().add(GetBoxOfficeMovies());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        ContentContainer(
          content: BlocBuilder<InTheaterMoviesBloc, InTheaterMoviesState>(
            builder: (_, state) {
              if (state is InTheaterMoviesInitial ||
                  state is LoadingInTheaterMovies) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is InTheaterMoviesLoadingError) {
                return Center(
                  child: IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      context
                          .read<InTheaterMoviesBloc>()
                          .add(GetInTheaterMovies());
                    },
                  ),
                );
              }
              if (state is InTheaterMoviesLoaded) {
                final List<Movie> movies = state.movies;
                return MovieListHolder(
                  movies: movies,
                  title: kNowPlaying,
                );
              }
              return const Center(
                child: Text(kUnexpectedError),
              );
            },
          ),
        ),
        const VerticalSpace(height: 16),
        ContentContainer(
          content: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (_, state) {
              if (state is PopularMoviesInitial ||
                  state is LoadingPopularMovies) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PopularMoviesLoadingError) {
                return Center(
                  child: IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      context.read<PopularMoviesBloc>().add(GetPopularMovies());
                    },
                  ),
                );
              }
              if (state is PopularMoviesLoaded) {
                final List<Movie> movies = state.movies;
                return MovieListHolder(
                  movies: movies,
                  title: kPopularMovies,
                );
              }
              return const Center(
                child: Text(kUnexpectedError),
              );
            },
          ),
        ),
        const VerticalSpace(height: 16),
        ContentContainer(
          content: BlocBuilder<TopMoviesBloc, TopMoviesState>(
            builder: (_, state) {
              if (state is TopMoviesInitial || state is LoadingTopMovies) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TopMoviesLoadingError) {
                return Center(
                  child: IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      context.read<TopMoviesBloc>().add(GetTopMovies());
                    },
                  ),
                );
              }
              if (state is TopMoviesLoaded) {
                final List<Movie> movies = state.movies;
                return MovieListHolder(
                  movies: movies,
                  title: kTopMovies,
                );
              }
              return const Center(
                child: Text(kUnexpectedError),
              );
            },
          ),
        ),
        const VerticalSpace(height: 16),
        ContentContainer(
          content: BlocBuilder<BoxOfficeMoviesBloc, BoxOfficeMoviesState>(
            builder: (_, state) {
              if (state is BoxOfficeMoviesInitial ||
                  state is LoadingBoxOfficeMovies) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BoxOfficeMoviesLoadingError) {
                return Center(
                  child: IconButton(
                    icon: const Icon(Icons.restart_alt_rounded),
                    onPressed: () {
                      context
                          .read<BoxOfficeMoviesBloc>()
                          .add(GetBoxOfficeMovies());
                    },
                  ),
                );
              }
              if (state is BoxOfficeMoviesLoaded) {
                final List<Movie> movies = state.movies;
                return MovieListHolder(
                  movies: movies,
                  title: kBoxOfficeMovies,
                );
              }
              return const Center(
                child: Text(kUnexpectedError),
              );
            },
          ),
        ),
        const VerticalSpace(height: 16),
      ],
    );
  }
}
