import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez_app/presentation/views/movie_detail/widgets/rating_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie_detail.dart';
import '../../../bloc/movie_detail/movie_detail_bloc.dart';
import '../../widgets/custom_network_image.dart';
import '../../widgets/movie_list.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/content_holder.dart';
import '../widgets/custom_scrollable_sheet.dart';
import '../widgets/movie_data_list.dart';
import '../widgets/trailer_thumbnail.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  final String movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(GetMovieDetail(widget.movieId));
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
              child: Text(state.msg),
            );
          }
          if (state is MovieDetailLoaded) {
            final MovieDetail movie = state.movie;
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomNetworkImage(
                    imageUrl: movie.image,
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
                                child: RatingCard(rating: movie.imDbRating),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border_rounded),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.watch_later_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const VerticalSpace(height: 12),
                        ContentHolder(
                          title: movie.title,
                          content: Text(
                            movie.plot,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        const VerticalSpace(height: 12),
                        MovieDataList(
                          runtime: movie.runtime,
                          releaseYear: movie.year,
                          contentRating: movie.contentRating,
                        ),
                        const VerticalSpace(height: 12),
                        ContentHolder(
                          title: "Trailer",
                          content: TrailerThumbnail(
                            youtubeId: movie.youtubeId,
                            onTap: () {
                              youtubePlayerController = YoutubePlayerController(
                                initialVideoId: movie.youtubeId,
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
                              movies: movie.similarMovies,
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
