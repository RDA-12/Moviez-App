import 'package:flutter/material.dart';

import '../../../../domain/entity/movie.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/custom_network_image.dart';

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
                return Card(
                  child: CustomNetworkImage(
                    imageUrl: movies[index].image,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
