import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie.dart';
import '../../../../domain/entity/movie_detail.dart';
import '../../../bloc/favorite_movies/favorite_movies_bloc.dart';
import '../../../bloc/movie_detail/movie_detail_bloc.dart';
import '../../../bloc/watchlist_movies/watchlist_movies_bloc.dart';
import '../../widgets/custom_network_image.dart';
import '../../widgets/movie_list.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/content_holder.dart';
import '../widgets/custom_scrollable_sheet.dart';
import '../widgets/movie_data_list.dart';
import '../widgets/rating_card.dart';
import '../widgets/trailer_thumbnail.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(GetMovieDetail(widget.movie.id));
    context.read<FavoriteMoviesBloc>().add(GetAllFavoriteMovies());
    context.read<WatchlistMoviesBloc>().add(GetAllWatchlistMovies());
  }

  @override
  void dispose() {
    // initialize to make sure the controller atleast assigned once
    youtubePlayerController = YoutubePlayerController(initialVideoId: "");
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (_, state) {
          if (state is MovieDetailInitial || state is LoadingMovieDetail) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieDetailLoadingError) {
            return Center(
              child: Text(
                state.msg,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            );
          }
          if (state is MovieDetailLoaded) {
            final MovieDetail movieDetail = state.movie;
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomNetworkImage(
                    imageUrl: movieDetail.image,
                  ),
                ),
                Positioned.fill(
                  child: CustomScrollableSheet(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RatingCard(
                                  rating: movieDetail.imDbRating,
                                ),
                              ),
                            ),
                            BlocBuilder<FavoriteMoviesBloc,
                                FavoriteMoviesState>(
                              builder: (context, state) {
                                if (state is FavoriteMoviesLoaded) {
                                  final List<Movie> favMovies = state.movies;
                                  return IconButton(
                                    icon: favMovies.any(
                                      (e) => e.id == widget.movie.id,
                                    )
                                        ? Icon(
                                            Icons.favorite,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )
                                        : Icon(
                                            Icons.favorite_border_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    onPressed: () {
                                      favMovies.any(
                                        (e) => e.id == widget.movie.id,
                                      )
                                          ? context
                                              .read<FavoriteMoviesBloc>()
                                              .add(DeleteFavoriteMovie(
                                                  widget.movie))
                                          : context
                                              .read<FavoriteMoviesBloc>()
                                              .add(AddFavoriteMovie(
                                                  widget.movie));
                                    },
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            BlocBuilder<WatchlistMoviesBloc,
                                WatchlistMoviesState>(
                              builder: (context, state) {
                                if (state is WatchlistMoviesLoaded) {
                                  final List<Movie> watMovies = state.movies;
                                  return IconButton(
                                    icon: watMovies.any(
                                      (e) => e.id == widget.movie.id,
                                    )
                                        ? Icon(
                                            Icons.watch_later,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )
                                        : Icon(
                                            Icons.watch_later_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    onPressed: () {
                                      watMovies.any(
                                        (e) => e.id == widget.movie.id,
                                      )
                                          ? context
                                              .read<WatchlistMoviesBloc>()
                                              .add(DeleteWatchlistMovie(
                                                  widget.movie))
                                          : context
                                              .read<WatchlistMoviesBloc>()
                                              .add(AddWatchlistMovie(
                                                  widget.movie));
                                    },
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                        const VerticalSpace(height: 12),
                        ContentHolder(
                          title: movieDetail.title,
                          content: Text(
                            movieDetail.plot,
                            textAlign: TextAlign.justify,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.7),
                                    ),
                          ),
                        ),
                        const VerticalSpace(height: 12),
                        MovieDataList(
                          runtime: movieDetail.runtime,
                          releaseYear: movieDetail.year,
                          contentRating: movieDetail.contentRating,
                        ),
                        const VerticalSpace(height: 12),
                        ContentHolder(
                          title: "Trailer",
                          content: TrailerThumbnail(
                            youtubeId: movieDetail.youtubeId,
                            onTap: () {
                              youtubePlayerController = YoutubePlayerController(
                                initialVideoId: movieDetail.youtubeId,
                              );
                              _showPlayer(
                                context: context,
                                ctrl: youtubePlayerController,
                              );
                            },
                          ),
                        ),
                        const VerticalSpace(height: 12),
                        ContentHolder(
                          title: "Simillar Movies",
                          content: SizedBox(
                            height: 200,
                            child: MovieList(
                              movies: movieDetail.similarMovies,
                              replacePage: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text(kUnexpectedError),
          );
        },
      ),
    );
  }

  void _showPlayer({
    required BuildContext context,
    required YoutubePlayerController ctrl,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: ctrl,
            showVideoProgressIndicator: true,
          ),
          builder: (_, child) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              child: child,
            );
          },
        );
      },
    );
  }
}
