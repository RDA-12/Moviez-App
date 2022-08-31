import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/movie_detail.dart';
import '../../../bloc/movie_detail/movie_detail_bloc.dart';
import '../../home/widgets/custom_network_image.dart';
import '../../home/widgets/interactive_card.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/info_card.dart';

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
                  child: DraggableScrollableSheet(
                    maxChildSize: 0.9,
                    builder: (_, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(movie.imDbRating),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.favorite),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.watch_later),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              const VerticalSpace(height: 12),
                              Text(
                                movie.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const VerticalSpace(height: 5),
                              Text(
                                movie.plot,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const VerticalSpace(height: 12),
                              SizedBox(
                                height: 100,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    InfoCard(
                                      title: "duration",
                                      data: movie.runtime,
                                      icon: Icons.restore,
                                    ),
                                    InfoCard(
                                      title: "release year",
                                      data: movie.year,
                                      icon: Icons.calendar_month_rounded,
                                    ),
                                    InfoCard(
                                      title: "accessibility",
                                      data: movie.contentRating,
                                      icon: Icons.lock_person_rounded,
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalSpace(height: 12),
                              const Text("Trailer"),
                              const VerticalSpace(height: 5),
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: InteractiveCard(
                                        child: CustomNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: getThumbnail(
                                            movie.youtubeId,
                                          ),
                                        ),
                                        onTap: () {
                                          youtubePlayerController =
                                              YoutubePlayerController(
                                            initialVideoId: movie.youtubeId,
                                          );
                                          _showPlayer(
                                            context: context,
                                            ctrl: youtubePlayerController,
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      child: Icon(
                                        Icons.play_circle_fill_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

  String getThumbnail(String id) {
    return "https://img.youtube.com/vi/$id/0.jpg";
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
