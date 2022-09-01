import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/movie.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/custom_network_image.dart';
import '../../widgets/interactive_card.dart';
import '../../widgets/vertical_space.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({
    Key? key,
    required this.movies,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const VerticalSpace(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder: (_, index) {
                return InteractiveCard(
                  child: CustomNetworkImage(
                    imageUrl: movies[index].image,
                  ),
                  onTap: () {
                    context.router.push(
                      MovieDetailRoute(movieId: movies[index].id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
